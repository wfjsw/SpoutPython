#cython: language_level=3
# distutils: language = c++
from spout_native cimport SPOUTLIBRARY, GetSpout
from libcpp cimport bool, nullptr

cdef class Spout:
    cdef SPOUTLIBRARY* c_spout
    cdef bool use_opengl
    cdef bool use_directx

    def __init__(self, use_opengl = False, use_directx = False):
        self.use_opengl = use_opengl
        self.use_directx = use_directx
        if self.use_opengl:
            self.c_spout.CreateOpenGL()
        if self.use_directx:
            self.c_spout.OpenDirectX11(nullptr)

    def __cinit__(self):
        self.c_spout = GetSpout()

    def __dealloc__(self):
        if self.use_opengl:
            self.c_spout.CloseOpenGL()
        if self.use_directx:
            self.c_spout.CloseDirectX()
        self.c_spout.Release()

    def set_sender_name(self, name: str):
        py_byte_name = name.encode('utf-8')
        cdef char* c_name = py_byte_name
        return self.c_spout.SetSenderName(c_name)

    def send_image(self, image, width, height, format, invert = False):
        cdef unsigned char* c_image = image
        return self.c_spout.SendImage(c_image, width, height, format, invert)

    def send_image_ndarray(self, image, format, invert = False):
        ravel = image.ravel()
        cdef unsigned int width = image.shape[1]
        cdef unsigned int height = image.shape[0]
        cdef const unsigned char[::1] c_image = ravel.data
        cdef unsigned int c_format = format
        cdef bool c_invert = invert

        with nogil:
            result = self.c_spout.SendImage(&c_image[0], width, height, c_format, c_invert)

        return result

    def get_spout_version(self):
        return self.c_spout.GetSpoutVersion()

    def hold_fps(self, fps):
        cdef int c_fps = fps
        with nogil:
            self.c_spout.HoldFps(c_fps)

    def wait_frame_sync(self, name: str):
        py_byte_name = name.encode('utf-8')
        cdef char* c_name = py_byte_name
        return self.c_spout.WaitFrameSync(c_name, 0)
