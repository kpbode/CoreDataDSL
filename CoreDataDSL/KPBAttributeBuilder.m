#import "KPBAttributeBuilder.h"

@interface KPBAttributeBuilder ()

@property (nonatomic, copy) NSString *name;
@property (nonatomic) NSAttributeType type;

@end

@implementation KPBAttributeBuilder

- (id)init
{
    self = [super init];
    if (!self) return nil;

    // TODO: defaults?

    [self setupBlocks];

    return self;
}

- (void)setupBlocks
{

    __block KPBAttributeBuilder *blockSelf = self;

    self.withType = ^KPBAttributeBuilder *(NSAttributeType type) {

        blockSelf.type = type;

        return blockSelf;
    };

}

- (void)buildAttributeDescriptionForEntity:(NSEntityDescription *)entityDescription
{
    NSAttributeDescription *attributeDescription = [NSAttributeDescription new];
    attributeDescription.name = _name;
    attributeDescription.attributeType = _type;

    entityDescription.properties = [entityDescription.properties arrayByAddingObject:attributeDescription];
}

@end

KPBAttributeBuilder *Attribute(NSString *name)
{
    KPBAttributeBuilder *builder = [KPBAttributeBuilder new];

    builder.name = name;

    return builder;
}