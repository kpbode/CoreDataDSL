#import "KPBNSManagedObjectModelRelationShipsBuilder.h"
#import "KPBRelationShipBuilder.h"


@implementation KPBNSManagedObjectModelRelationShipsBuilder

- (void)buildAspectForModel:(NSManagedObjectModel *)managedObjectModel
{

    for (KPBRelationShipBuilder *relationShipBuilder in _relationShipBuilders) {

        [relationShipBuilder buildRelationShipDescriptionForModel:managedObjectModel];

    }

}

@end