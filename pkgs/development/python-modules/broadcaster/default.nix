{ lib, buildPythonPackage, fetchPypi, typing-extensions, anyio, redis, postgresql, kafka-python-ng }:

buildPythonPackage rec {
  pname = "permit_broadcaster";
  version = "0.2.6";

  src = fetchPypi {
    pname = pname;
    version = version;
    sha256 = "sha256-gmRJ8fWM/eBUWndsXlrbZ+tmE0ESZFmaeqeLkyTWgvI=";
  };

  propagatedBuildInputs = [
    redis 
    postgresql
    kafka-python-ng
  ];

  meta = with lib; {
    description = "A broadcasting library for Python.";
    license = licenses.mit;
    maintainers = with maintainers; [ your-github-username ];
  };
}
