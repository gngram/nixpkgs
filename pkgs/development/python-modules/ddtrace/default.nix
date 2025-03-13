{ lib
, buildPythonPackage
, fetchPypi
, bytecode
, envier
, opentelemetry-api
, protobuf
, typing-extensions
, wrapt
, xmltodict
, cython
, setuptools
, setuptools-rust
,cmake
,rustc
,cargo
,wheel
,setuptools_scm
}:
let
cmake-327 = cmake.overrideAttrs (old: {
  version = "3.27.0";
});
in
buildPythonPackage rec {
  pname = "ddtrace";
  version = "3.2.1";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-1/0zqoATG8fMYZzVvGM5XIriVmqknlh32NQpUESwfd0=";
  };
  build-system = [ setuptools];
  postPatch = ''
    substituteInPlace setup.py \
      --replace "install_requires=get_requirements()," "install_requires=['bytecode', 'envier', 'opentelemetry-api', 'protobuf', 'typing-extensions', 'wrapt', 'xmltodict'],"
  '';

  nativeBuildInputs = [
    setuptools_scm
    cmake-327
    cython
    setuptools
    setuptools-rust
    rustc
    cargo
    wheel
  ];
  configurePhase = ''
    echo GGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGtttttttttttttttttttttttG

  '';

  propagatedBuildInputs = [
    bytecode
    envier
    opentelemetry-api
    protobuf
    typing-extensions
    wrapt
    xmltodict
  ];

  meta = with lib; {
    description = "Datadog APM client for Python.";
    license = licenses.mit;
    maintainers = with maintainers; [ your-github-username ];
  };
}

