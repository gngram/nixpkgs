{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  pythonOlder,
  fetchPypi,
fastapi,
packaging,
pydantic,
websockets,
tenacity,
pytest,
pytest-asyncio,
uvicorn,
wheel,
hatchling,
}:

buildPythonPackage rec {
  pname = "fastapi_websocket_rpc";
  version = "0.1.28";

  disabled = pythonOlder "3.7";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-YiWfxR2xMCdBDGGgJZGKYYzRqO8c8pTq3eYu9IeA0Ek=";
  };

  build-system = [ setuptools wheel hatchling ];
postPatch = ''
    substituteInPlace setup.py \
      --replace "install_requires=get_requirements()," "install_requires=['fastapi', 'packaging', 'pydantic', 'websockets', 'tenacity'],"
  '';
  propagatedBuildInputs = [ 
fastapi
packaging
pydantic
websockets
tenacity
  ];

nativeCheckInputs = [
pytest
pytest-asyncio
uvicorn
  ];

  pythonImportsCheck = [ "fastapi_websocket_rpc" ];

  disabledTests = [
    # Tests (SystemError) fails randomly during nixpkgs-review
  ];

  meta = with lib; {
    description = "File operations with asyncio support";
    homepage = "https://github.com/mosquito/aiofile";
    changelog = "https://github.com/aiokitchen/aiomisc/blob/master/CHANGELOG.md";
    license = licenses.asl20;
    maintainers = with maintainers; [ fab ];
  };
}
