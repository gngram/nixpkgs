{ lib, buildPythonPackage, fetchPypi, typing-extensions, http,
click,
cryptography,
gitpython,
loguru,
pyjwt,
python-decouple,
tenacity,
datadog,
ddtrace,
certifi,
requests,
httpx,
urllib3, 
}:

buildPythonPackage rec {
  pname = "opal-common";
  version = "0.8.0";

  src = fetchPypi {
    pname = pname;
    version = version;
    sha256 = "";
  };

  propagatedBuildInputs = [
http
click
cryptography
gitpython
loguru
pyjwt
python-decouple
tenacity
datadog
ddtrace
certifi
requests
httpx
urllib3
  ];

  meta = with lib; {
    description = "A broadcasting library for Python.";
    license = licenses.mit;
    maintainers = with maintainers; [ your-github-username ];
  };
}

/*
opal = pkgs.python311.pkgs.buildPythonApplication rec {
  5     pname = "opal";
  6     version = "0.8.0"; # Replace with the desired Opal version.
  7     src = pkgs.fetchFromGitHub {
  8       owner = "permitio";
  9       repo = "opal";
 10       rev = "${version}";
 11       sha256 = "sha256-KAST4yFYH6/Zv7R6aadUDYOomwuwRU4NP55uaWbVlxI=";
 12     };
 13 
 14     # Use makeWrapper to wrap your Python application
 15     nativeBuildInputs = [ pkgs.makeWrapper pkgs.python311Packages.setuptools ];
 16 
 17     # Define sourceRoot if your app resides in a subdirectory
 18     sourceRoot =  "${src.name}/packages/opal-common";
 19 
 20     # Ensure this path is correct for the executable script
 21     meta = with pkgs.lib; {
 22       description = "Opal common package";
 23       license = licenses.asl20;
 24       maintainers = with maintainers; [ ];
 25       homepage = "https://www.opal.dev/";
 26     };
 27   };
*/
