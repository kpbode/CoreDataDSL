#import "KPBRelationShipBuilder.h"

@interface KPBRelationShipBuilder ()

@property (nonatomic, copy) NSString *fromEntityName;
@property (nonatomic, copy) NSString *toEntityName;

@end

@implementation KPBRelationShipBuilder

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

@end

KPBRelationShipBuilder *RelationShip()
{
    return [KPBRelationShipBuilder new];
}