{
  lib,
  buildPythonPackage,
  setuptools,
  pythonOlder,
  fetchPypi,
fastapi-websocket-rpc,
packaging,
broadcaster,
pydantic,
websockets,

pytest,
pytest-asyncio,
uvicorn,
}:

buildPythonPackage rec {
  pname = "fastapi_websocket_pubsub";
  version = "0.3.7";

  disabled = pythonOlder "3.7";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-eFzp2DXscQ2W7m+kz7a+0ewXbsoSYlNzImRTyLaTb2k=";
  };

  build-system = [ setuptools];
  postPatch = ''
    substituteInPlace setup.py \
      --replace "install_requires=get_requirements()," "install_requires=['fastapi-websocket-rpc', 'packaging', 'pydantic', 'websockets', 'broadcaster'],"
  '';
  propagatedBuildInputs = [ 
broadcaster
fastapi-websocket-rpc
packaging
pydantic
websockets
    
  ];

nativeCheckInputs = [
pytest
pytest-asyncio
uvicorn
  ];

  pythonImportsCheck = [ "fastapi_websocket_pubsub" ];

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
