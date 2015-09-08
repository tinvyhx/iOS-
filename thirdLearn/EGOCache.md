#EGOCache 主要是根据文件系统对文件的操作形成缓存 &*&*&*&*&*&*&*
#文件操作基于data(- (BOOL)writeToFile:(NSString *)path atomically:(BOOL)useAuxiliaryFile;)

#缓存超时处理：初始化的时候对所有缓存数据进行时间判定,这里的时间判定 内置了一个plist文件存储缓存信息

image string data data plist 又或者任意对象<NSCoding> 都可以成为缓存的对象
摘抄公开方法

+ (instancetype)currentCache __deprecated; // Renamed to globalCache

// Global cache for easy use
//这里的单例实现使用gcd once
+ (instancetype)globalCache;

// Opitionally create a different EGOCache instance with it's own cache directory
- (id)initWithCacheDirectory:(NSString*)cacheDirectory;

- (void)clearCache;
- (void)removeCacheForKey:(NSString*)key;

- (BOOL)hasCacheForKey:(NSString*)key;

- (NSData*)dataForKey:(NSString*)key;
- (void)setData:(NSData*)data forKey:(NSString*)key;
- (void)setData:(NSData*)data forKey:(NSString*)key withTimeoutInterval:(NSTimeInterval)timeoutInterval;

- (NSString*)stringForKey:(NSString*)key;
- (void)setString:(NSString*)aString forKey:(NSString*)key;
- (void)setString:(NSString*)aString forKey:(NSString*)key withTimeoutInterval:(NSTimeInterval)timeoutInterval;

- (NSDate*)dateForKey:(NSString*)key;
- (NSArray*)allKeys;

#if TARGET_OS_IPHONE
- (UIImage*)imageForKey:(NSString*)key;
- (void)setImage:(UIImage*)anImage forKey:(NSString*)key;
- (void)setImage:(UIImage*)anImage forKey:(NSString*)key withTimeoutInterval:(NSTimeInterval)timeoutInterval;
#else
- (NSImage*)imageForKey:(NSString*)key;
- (void)setImage:(NSImage*)anImage forKey:(NSString*)key;
- (void)setImage:(NSImage*)anImage forKey:(NSString*)key withTimeoutInterval:(NSTimeInterval)timeoutInterval;
#endif

- (NSData*)plistForKey:(NSString*)key;
- (void)setPlist:(id)plistObject forKey:(NSString*)key;
- (void)setPlist:(id)plistObject forKey:(NSString*)key withTimeoutInterval:(NSTimeInterval)timeoutInterval;

- (void)copyFilePath:(NSString*)filePath asKey:(NSString*)key;
- (void)copyFilePath:(NSString*)filePath asKey:(NSString*)key withTimeoutInterval:(NSTimeInterval)timeoutInterval;	

- (id<NSCoding>)objectForKey:(NSString*)key;
- (void)setObject:(id<NSCoding>)anObject forKey:(NSString*)key;
- (void)setObject:(id<NSCoding>)anObject forKey:(NSString*)key withTimeoutInterval:(NSTimeInterval)timeoutInterval;

@property(nonatomic,assign) NSTimeInterval defaultTimeoutInterval; // Default is 1 week

