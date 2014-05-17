@import CoreData;

@class KPBEntityBuilder;
@class KPBAttributeBuilder;

extern KPBEntityBuilder *Entity(NSString *name);

@interface KPBEntityBuilder : NSObject

+ (instancetype)builderWithName:(NSString *)name;

@property (nonatomic, copy) KPBEntityBuilder *(^withParentEntity)(NSString *parentEntityName);
@property (nonatomic, copy) KPBEntityBuilder *(^withAttributes)(KPBAttributeBuilder *attributeBuilder, ...);

- (NSEntityDescription *)buildEntityDescriptionForModel:(NSManagedObjectModel *)managedObjectModel;

@end

