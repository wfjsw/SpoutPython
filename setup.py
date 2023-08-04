from setuptools import setup, Extension
from Cython.Build import cythonize

extensions = [
    Extension(
        "spout",
        sources=["spout.pyx"],
        library_dirs=['./spout/SPOUTSDK/SpoutLibrary/Binaries/x64'],
        libraries=['SpoutLibrary'],
    )
]

setup(
    name='spoutpython',
    version='1.0.0',
    author='wfjsw',
    ext_modules=cythonize(extensions),
    data_files=[('', ['./spout/SPOUTSDK/SpoutLibrary/Binaries/x64/SpoutLibrary.dll'])],
)
