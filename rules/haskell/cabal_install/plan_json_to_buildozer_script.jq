def _kv:
  to_entries[] | "\(.key):\(.value)"
  ;
  
def rule(kind; name; attrs):
    name as $name
  | $ARGS.named.package as $package
  | "new \(kind) \($name)|\($package):__pkg__"
  , (attrs | . + "|\($package):\($name)")
  ;

def set($attr; f):
  "set \($attr) \(f)"
  ;

def set_list($attr; f):
  if isempty(f[]) then empty else set($attr; f | join(" ")) end
  ;

def dict_set($attr; f):
  "dict_set \($attr) \(f | _kv)"
  ;

def dict_list_add($attr; $key; f):
  if isempty(f[]) then empty else
  "dict_list_add \($attr) \($key) \(f | join(" "))"
  end
  ;

def basic:
  set("pkg_name"; ."pkg-name" | @sh),
  set("pkg_version"; ."pkg-version" | @sh)
  ;

def pre_existing_unit: 
  rule("pre_existing_unit"; .id;
    basic,
    set_list("deps"; .depends)
  )
  ;

def configured_legacy_unit:
  rule("configured_legacy_unit"; .id;
      basic
    , dict_set("flags"; .flags)
    , set_list("components"; .components | del(.setup) | keys | map(@sh))
    , ( .components | del(.setup) | to_entries[]
      | dict_list_add("deps"; .key; .value.depends | map(@sh))
      , dict_list_add("exec_deps"; .key; .value."exe-depends" | map(@sh))
      )
    , if has("setup") then
          dict_list_add("setup"; "deps"; .components.setup.depends | map(@sh))
        , dict_list_add("setup"; "exe-depends"; .components.setup."exe-depends" | map(@sh))
      else
        empty
      end
  )
  ;

def configured_unit: 
  rule("configured_unit"; .id;
      basic
    , set("component_name"; ."component-name" | @sh)
    , dict_set("flags"; .flags)
    , set_list("deps"; .depends | map(@sh))
    , set_list("exec_deps"; ."exe-depends" | map(@sh))
  )
  ;

rule("project_toolchain"; "project_toolchain"; 
    set("compiler_id"; ."compiler-id" | @sh)
  , set("cabal_version"; ."cabal-version" | @sh)
  , set("cabal_lib_version"; ."cabal-lib-version" | @sh)
  , set("os"; .os | @sh)
  , set("arch"; .arch | @sh)
)
, (."install-plan"[]
  | if .type == "pre-existing" then
     pre_existing_unit
   elif .type == "configured" then
     if has("components") then
       configured_legacy_unit
     else 
       configured_unit
     end
   end
  )
