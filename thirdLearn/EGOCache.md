#EGOCache 主要是根据文件系统对文件的操作形成缓存 &*&*&*&*&*&*&*
#文件操作基于data(- (BOOL)writeToFile:(NSString *)path atomically:(BOOL)useAuxiliaryFile;)

#缓存超时处理：初始化的时候对所有缓存数据进行时间判定,这里的时间判定 内置了一个plist文件存储缓存信息

image string data data plist 又或者任意对象<NSCoding>


