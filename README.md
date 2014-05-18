# CoreDataDSL
This is an experiment - for now.

```
NSManagedObjectModel *model = buildCoreDataModel(

  withEntities(
    Entity(@"Book").withAttributes(
      Attribute(@"title").withType(NSStringAttributeType), nil
    ),

    Entity(@"Page"),
    nil
  ),

  withRelationShips(
    RelationShip(@"pages").from(@"Book").to(@"Pages"), nil
  ),

  nil
);

```
