{ mkDerivation, base, hspec, stdenv }:
mkDerivation {
  pname = "morphism-zoo";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [ base ];
  executableHaskellDepends = [ base ];
  testHaskellDepends = [ base hspec ];
  homepage = "https://github.com/vmchale/morphism-zoo#readme";
  license = stdenv.lib.licenses.bsd3;
}
