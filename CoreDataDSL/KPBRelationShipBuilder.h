@import CoreData;

@class KPBRelationShipBuilder;

extern KPBRelationShipBuilder *RelationShip(NSString *name);

@interface KPBRelationShipBuilder : NSObject

+ (instancetype)relationShipBuilderWithName:(NSString *)name;

@property (nonatomic, copy) KPBRelationShipBuilder *(^from)(NSString *);

- (void)buildRelationShipDescriptionForModel:(NSManagedObjectModel *)managedObjectModel;

@property (nonatomic, copy) KPBRelationShipBuilder *(^to)(NSString *);

@end