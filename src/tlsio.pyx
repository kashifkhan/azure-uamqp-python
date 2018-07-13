#-------------------------------------------------------------------------
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License. See License.txt in the project root for
# license information.
#--------------------------------------------------------------------------

# C imports
cimport c_tlsio
cimport c_xio


DEFAULT_PORT = 5671


cdef class TLSIOConfig:

    cdef c_tlsio.TLSIO_CONFIG _c_value

    def __cinit__(self):
        self._c_value = c_tlsio.TLSIO_CONFIG(NULL, DEFAULT_PORT, NULL, NULL)

    @property
    def hostname(self):
        return self._c_value.hostname

    @hostname.setter
    def hostname(self, const char* value):
        self._c_value.hostname = value

    @property
    def port(self):
        return self._c_value.port

    @port.setter
    def port(self, int port):
        self._c_value.port = port

    cdef set_underlying_io(self, const c_xio.IO_INTERFACE_DESCRIPTION* underlying_io_interface, void* underlying_io_parameters):
        self._c_value.underlying_io_interface = underlying_io_interface
        self._c_value.underlying_io_parameters = underlying_io_parameters


cdef class HTTPProxyConfig:

    cdef c_tlsio.HTTP_PROXY_IO_CONFIG_TAG _c_value

    def __cinit__(self):
        self._c_value = c_tlsio.HTTP_PROXY_IO_CONFIG_TAG(NULL, 0, NULL, 0, NULL, NULL)

    @property
    def hostname(self):
        return self._c_value.hostname

    @hostname.setter
    def hostname(self, const char* value):
        self._c_value.hostname = value

    @property
    def port(self):
        return self._c_value.port

    @port.setter
    def port(self, int port):
        self._c_value.port = port

    @property
    def proxy_hostname(self):
        return self._c_value.proxy_hostname

    @proxy_hostname.setter
    def proxy_hostname(self, const char* value):
        self._c_value.proxy_hostname = value

    @property
    def proxy_port(self):
        return self._c_value.proxy_port

    @proxy_port.setter
    def proxy_port(self, int port):
        self._c_value.proxy_port = port

    @property
    def username(self):
        return self._c_value.username

    @username.setter
    def username(self, const char* value):
        self._c_value.username = value

    @property
    def password(self):
        return self._c_value.password

    @password.setter
    def password(self, const char* value):
        self._c_value.password = value
