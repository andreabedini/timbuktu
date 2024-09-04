#!/bin/bash

if [ -f Setup.hs ]; then
  runhaskell Setup.hs "$@"
elif [[ -f Setup.lhs ]]; then
  runhaskell Setup.lhs "$@"
else
  echo "No Setup.hs or Setup.lhs script found, assuming simple build (which is WRONG)"
  runhaskell "${BUCK_DEFAULT_RUNTIME_RESOURCES}/helpers/Simple.hs" "$@"
fi
