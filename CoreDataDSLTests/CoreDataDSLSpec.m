//
//  CoreDataDSLTests.m
//  CoreDataDSLTests
//
//  Created by Karl on 17/05/14.
//  Copyright (c) 2014 Karl Bode. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "CoreDataDSL.h"

SPEC_BEGIN(CoreDataDSLSpec)

    describe(@"The Model", ^{

        it(@"should a return a valid NSManagedObjectModel", ^{

            NSManagedObjectModel *model = buildCoreDataModel(

                    withEntities(

                            Entity(@"Book").withAttributes(
                                    Attribute(@"title").withType(NSStringAttributeType), nil
                            ),
                            Entity(@"Page"),
                            nil),

                    withRelationShips(
                            RelationShip().from(@"Book").to(@"Page")
                    ),

                    nil
            );

            [[model shouldNot] beNil];
            [[model.entities should] haveCountOf:2];

            NSEntityDescription *bookEntityDescription = model.entitiesByName[@"Book"];
            [[bookEntityDescription shouldNot] beNil];

            NSAttributeDescription *titleAttributeDescription = bookEntityDescription.attributesByName[@"title"];
            [[titleAttributeDescription shouldNot] beNil];
            [[theValue(titleAttributeDescription.attributeType) should] equal:theValue(NSStringAttributeType)];

        });

    });

SPEC_END

