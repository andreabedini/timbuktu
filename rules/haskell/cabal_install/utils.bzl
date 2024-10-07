def _in_dir(*script, work_dir):
    return cmd_args("env", "-C", work_dir, cmd_args(relative_to = work_dir, *script))
