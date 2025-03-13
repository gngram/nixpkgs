{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
fastapii,
packaging,
pydantic,
websockets,
tenacity
}:

buildPythonPackage rec {
  pname = "fastapi_websocket_rpc";
  version = "0.1.29";
  pyproject = true;

  disabled = pythonOlder "3.7";

  src = fetchFromGitHub {
    owner = "permitio";
    repo = "fastapi_websocket_";
    tag = version;
    hash = "";
  };

  build-system = [ setuptools ];

  propagatedBuildInputs = [ 
fastapii,
packaging,
pydantic,
websockets,
tenacity
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
