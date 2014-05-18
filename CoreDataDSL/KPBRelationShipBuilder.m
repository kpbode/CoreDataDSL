#import "KPBRelationShipBuilder.h"

@interface KPBRelationShipBuilder ()

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *fromEntityName;
@property (nonatomic, copy) NSString *toEntityName;

@end

@implementation KPBRelationShipBuilder

+ (instancetype)relationShipBuilderWithName:(NSString *)name
{
    KPBRelationShipBuilder *builder = [KPBRelationShipBuilder new];
    builder.name = name;
    return builder;
}

- (id)init
{
    self = [super init];
    if (!self) return nil;

    [self setupBlocks];

    return self;
}

- (void)setupBlocks
{
    __block KPBRelationShipBuilder *blockSelf = self;

    self.from = ^KPBRelationShipBuilder *(NSString *entityName) {

        blockSelf.fromEntityName = entityName;

        return blockSelf;
    };

    self.to = ^KPBRelationShipBuilder *(NSString *entityName) {

        blockSelf.toEntityName = entityName;

        return blockSelf;
    };

}

- (void)buildRelationShipDescriptionForModel:(NSManagedObjectModel *)managedObjectModel
{

    NSRelationshipDescription *relationshipDescription = [NSRelationshipDescription new];
    relationshipDescription.name = _name;

    NSEntityDescription *fromEntityDescription = managedObjectModel.entitiesByName[_fromEntityName];
    fromEntityDescription.properties = [fromEntityDescription.properties arrayByAddingObject:relationshipDescription];

    NSEntityDescription *toEntityDescription = managedObjectModel.entitiesByName[_toEntityName];
    relationshipDescription.destinationEntity = toEntityDescription;


}

@end

KPBRelationShipBuilder *RelationShip(NSString *name)
{
    return [KPBRelationShipBuilder relationShipBuilderWithName:name];
}