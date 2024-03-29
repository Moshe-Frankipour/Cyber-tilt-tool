from fastapi_sessions.session_verifier import SessionVerifier
from uuid import UUID
from models.user import loginUser
from fastapi_sessions.backends.implementations import InMemoryBackend
from fastapi import HTTPException


class BasicVerifier(SessionVerifier[UUID, loginUser]):
    def __init__(
        self,
        *,
        identifier: str,
        auto_error: bool,
        backend: InMemoryBackend[UUID, loginUser],
        auth_http_exception: HTTPException,
    ):
        self._identifier = identifier
        self._auto_error = auto_error
        self._backend = backend
        self._auth_http_exception = auth_http_exception

    @property
    def identifier(self):
        return self._identifier

    @property
    def backend(self):
        return self._backend

    @property
    def auto_error(self):
        return self._auto_error

    @property
    def auth_http_exception(self):
        return self._auth_http_exception

    def verify_session(self, model: loginUser) -> bool:
        """If the session exists, it is valid"""
        return True
