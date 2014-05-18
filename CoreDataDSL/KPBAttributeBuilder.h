@import CoreData;

@class KPBAttributeBuilder;

extern KPBAttributeBuilder *Attribute(NSString *name);

@interface KPBAttributeBuilder : NSObject

@property (nonatomic, copy) KPBAttributeBuilder *(^withType)(NSAttributeType type);

- (void)buildAttributeDescriptionForEntity:(NSEntityDescription *)entityDescription;

@end