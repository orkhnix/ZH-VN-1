# Kakathic
# This triggers on post-fs-data when /data is decrypted and mounted. The daemon magiskd will be launched, post-fs-data scripts are executed, and module files are magic mounted
rm -fr /data/dalvik-cache/*
rm -fr /data/system/package_cache/*
rm -fr /data/resource-cache/*
