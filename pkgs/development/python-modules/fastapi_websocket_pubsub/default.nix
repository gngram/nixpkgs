{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  fastapi-websocket-rpc,
  packaging,
  redis,
  postgres,
  kafka,
  pydantic,
  websockets
}:

buildPythonPackage rec {
  pname = "fastapi_websocket_pubsub";
  version = "0.3.9";
  pyproject = true;

  disabled = pythonOlder "3.7";

  src = fetchFromGitHub {
    owner = "permitio";
    repo = "fastapi_websocket_pubsub";
    tag = version;
    hash = "089msbw8jwdbfjngw9rq7jrjdj69c6qdaznz7v422d39nzz1knak";
  };

  build-system = [ setuptools ];

  propagatedBuildInputs = [ 
  fastapi-websocket-rpc,
  packaging,
  redis,
  postgres,
  kafka,
  pydantic,
  websockets
  ];

  nativeCheckInputs = [
pytest
pytest-asyncio
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
