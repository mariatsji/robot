# Robot

A virtual robot that reads instructions and moves

.. Teaching my kids how to program

## install

nix-build robot.nix

## develop

nix-shell

> cabal test
> cabal run

## play

create a file e.g. instructions.txt with the contents e.g.

```
go 2
turn right
go 5
turn left
go 1
```

nix-build robot.txt and invoke the resulting binary with e.g.
/nix/store/jjlr6pqkl55l10c1654xglikcxkxvgr0-robot-0.1.0.0/bin/robot instructions.txt