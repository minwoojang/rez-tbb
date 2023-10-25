name = "tbb"

version = "2020.3"

description = """
    Threading Building Blocks is a C++ template library developed by Intel for parallel programming on multi-core
    processors. Using TBB, a computation is broken down into tasks that can run in parallel. The library manages
    and schedules threads to execute these tasks.
    """

authors = [
    "Intel",
]

requires = [
    "cmake-3",
]

variants = [
    [
        "platform-linux",
    ],
]

build_system = "cmake"


with scope("config") as config:
    config.build_thread_count = "logical_cores"


def commands():
    env.LIBRARY_PATH.prepend("{root}/tbb/lib/intel64/gcc4.8")
    env.LD_LIBRARY_PATH.prepend("{root}/tbb/lib/intel64/gcc4.8")
    env.MIC_LIBRARY_PATH.prepend("{root}/tbb/lib/intel64/gcc4.8")
    env.MIC_LD_LIBRARY_PATH.prepend("{root}/tbb/lib/intel64/gcc4.8")
    env.CPATH.prepend("{root}/tbb/include")
    env.CMAKE_MODULE_PATH.prepend("{root}/tbb/cmake")
    env.TBBROOT.set("{root}/tbb")
    env.TBB_TARGET_ARCH.set("intel64")
    env.TBB_TARGET_PLATFORM.set("linux")

    # Helper environment variables.
    env.TBB_BINARY_PATH.set("{root}/tbb/bin")
    env.TBB_INCLUDE_PATH.set("{root}/tbb/include")
    env.TBB_LIBRARY_PATH.set(f"{{root}}/tbb/lib/{env.TBB_TARGET_ARCH}/gcc4.8")
