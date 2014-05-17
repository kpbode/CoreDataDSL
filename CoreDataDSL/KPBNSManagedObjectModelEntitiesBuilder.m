#import "KPBNSManagedObjectModelEntitiesBuilder.h"
#import "KPBEntityBuilder.h"

@implementation KPBNSManagedObjectModelEntitiesBuilder

- (void)buildAspectForModel:(NSManagedObjectModel *)managedObjectModel
{
    managedObjectModel.entities = @[];

    for (KPBEntityBuilder *entityBuilder in _entityBuilders) {
        [entityBuilder buildEntityDescriptionForModel:managedObjectModel];
    }
}

@end