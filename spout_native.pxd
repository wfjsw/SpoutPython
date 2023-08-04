#cython: language_level=3

from libcpp cimport bool
from libcpp.string cimport string

cdef extern from "spout/SPOUTSDK/SpoutLibrary/SpoutLibrary.h" nogil:
    cdef cppclass SPOUTLIBRARY:
        void SetSenderName(char*)
        void SendSenderFormat(unsigned int)
        void ReleaseSender(unsigned int)
        bool SendFbo(unsigned int, unsigned int, unsigned int, bool)
        bool SendTexture(unsigned int, unsigned int, unsigned int, unsigned int, bool, unsigned int)
        bool SendImage(unsigned char*, unsigned int, unsigned int, unsigned int, bool)
        char* GetName()
        unsigned int GetWidth()
        unsigned int GetHeight()
        double GetFps()
        long GetFrame()
        void* GetHandle()
        bool GetCPU()
        bool GetGLDX()

        void SetReceiverName(char*)
        void ReleaseReceiver()

        bool ReceiveTexture(unsigned int, unsigned int, bool, unsigned int)
        bool ReceiveImage(unsigned char*, unsigned int, bool, unsigned int)
        bool IsUpdated()
        bool IsConnected()
        bool IsFrameNew()
        char* GetSenderName()
        unsigned int GetSenderWidth()
        unsigned int GetSenderHeight()
        unsigned int GetSenderFormat()
        double GetSenderFps()
        long GetSenderFrame()
        void* GetSenderHandle()
        bool GetSenderCPU()
        bool GetSenderGLDX()
        void SelectSender()

        void SetFrameCount(bool)
        void DisableFrameCount()
        bool IsFrameCountEnabled()
        void HoldFps(int)
        double GetRefreshRate()
        void SetFrameSync(char*)
        bool WaitFrameSync(char*, unsigned int)

        bool WriteMemoryBuffer(char*, char*, int)
        int ReadMemoryBuffer(char*, char*, int)
        bool CreateMemoryBuffer(char*, int)
        bool DeleteMemoryBuffer()
        int GetMemoryBufferSize(char*)

        void OpenSpoutConsole()
        void CloseSpoutConsole(bool)
        void EnableSpoutLog()
        void EnableSpoutLogFile(char*, bool)
        string GetSpoutLog()
        void ShowSpoutLogs()
        void DisableSpoutLog()
        void SetSpoutLogLevel(unsigned int) # TODO
        void SpoutLog(char*, ...)
        void SpoutLogVerbose(char*, ...)
        void SpoutLogNotice(char*, ...)
        void SpoutLogWarning(char*, ...)
        void SpoutLogError(char*, ...)
        void SpoutLogFatal(char*, ...)
        int SpoutMessageBox(char*, unsigned int)
        # int SpoutMessageBox

        # bool ReadDwordFromRegistry
        # bool WriteDwordToRegistry
        # bool ReadPathFromRegistry
        # bool WritePathToRegistry
        # bool RemovePathFromRegistry
        # bool RemoveSubKey
        # bool FindSubKey

        string GetSDKversion()
        bool IsLaptop()

        void StartTiming()
        double EndTiming()

        bool IsInitialized()
        bool BindSharedTexture()
        bool UnBindSharedTexture()
        unsigned int GetSharedTextureID()

        int GetSenderCount()
        bool GetSender(int, char*, int)
        bool FindSenderName(char*)
        bool GetSenderInfo(char*, unsigned int, unsigned int, void*, unsigned int)
        bool GetActiveSender(char*)
        bool SetActiveSender(char*)

        bool GetBufferMode()
        void SetBufferMode(bool)
        int GetBuffers()
        void SetBuffers(int)
        int GetMaxSenders()
        void SetMaxSenders(int)



        bool GetHostPath(char*, char*, int)
        int GetVerticalSync()
        bool SetVerticalSync(bool)
        int GetSpoutVersion()

        bool CreateOpenGL()
        bool CloseOpenGL()
        bool CopyTexture(unsigned int, unsigned int, unsigned int, unsigned int, unsigned int, unsigned int, bool, unsigned int)

        bool OpenDirectX()
        bool CloseDirectX()

        bool OpenDirectX11(void*)
        void CloseDirectX11()

        void* GetDX11Device()
        void* GetDX11Context()

        void Release()

    SPOUTLIBRARY* GetSpout()
