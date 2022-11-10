import("utils.archive")
import("download")

if (os.host() =="macosx") then 
    local release_url = "llvm/llvm-project/releases/download/llvmorg-15.0.1/clang+llvm-15.0.1-x86_64-apple-darwin.tar.xz"
    local zipname = "clang+llvm-15.0.1-x86_64-apple-darwin.tar.xz"
    download.file_from_github(release_url, zipname)
    archive.extract("SDKs/"..zipname, os.projectdir())
end