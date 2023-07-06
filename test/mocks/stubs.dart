import 'package:demo_app_architecture/core/domain/model/cat.dart';

class Stubs {
  static final cats = [
    const Cat(
      tags: ['small cat', 'brazilian', 'brazilian cat', 'brasileira'],
      id: '1',
      owner: 'John Doe',
      createdAt: '2022-01-01',
      updatedAt: '2022-01-02',
    ),
    const Cat(
      tags: ['cute', 'kitten', 'black and white'],
      id: '2',
      owner: 'Jane Smith',
      createdAt: '2022-01-03',
      updatedAt: '2022-01-04',
    ),
    // Additional mock cat objects
    const Cat(
      tags: ['fluffy', 'persian', 'white'],
      id: '3',
      owner: 'Alice Johnson',
      createdAt: '2022-01-05',
      updatedAt: '2022-01-06',
    ),
    const Cat(
      tags: ['playful', 'tabby', 'striped'],
      id: '4',
      owner: 'Bob Thompson',
      createdAt: '2022-01-07',
      updatedAt: '2022-01-08',
    ),
    const Cat(
      tags: ['lazy', 'siamese', 'blue eyes'],
      id: '5',
      owner: 'Emma Wilson',
      createdAt: '2022-01-09',
      updatedAt: '2022-01-10',
    ),
  ];

  static final List<Map<String, dynamic>> catsDataDynamic = [
    {
      'tags': ['Tag 1', 'Tag 2'],
      'id': '1',
      'owner': 'Owner 1',
      'createdAt': '2023-07-01',
      'updatedAt': '2023-07-02',
    },
    {
      'tags': ['Tag 3', 'Tag 4'],
      'id': '2',
      'owner': 'Owner 2',
      'createdAt': '2023-07-03',
      'updatedAt': '2023-07-04',
    },
  ];

  static const String catsResponseBody = '''
        [
          {
            "tags": ["playful", "tabby", "striped"],
            "id": "4",
            "owner": "Bob Thompson",
            "createdAt": "2022-01-07",
            "updatedAt": "2022-01-08"
          }
        ]
      ''';
}
