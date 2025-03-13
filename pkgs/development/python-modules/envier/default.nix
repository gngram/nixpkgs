{ lib, buildPythonPackage, fetchPypi,}:

buildPythonPackage rec {
  pname = "envier";
  version = "0.6.0";

  src = fetchPypi {
    pname = pname;
    version = version;
    sha256 = "sha256-naHmtY96RX9bjWdl1HYjtLrTri0p1qLRj5NS9qWxafc=";
  };
  format = "other";

  propagatedBuildInputs = [
  ];

  meta = with lib; {
    description = "A broadcasting library for Python.";
    license = licenses.mit;
    maintainers = with maintainers; [ your-github-username ];
  };
}
