class Category {
  Category({
    this.name = '',
    this.specialist = '',
    this.experience = 0,
    this.rating = 0.0,
  });

  String name;
  String specialist;
  int experience;
  double rating;




  static List<Category> popularList = <Category>[
    Category(
      name: 'ABC',
      specialist: 'General',
      experience: 25,
      rating: 4.8,
    ),
    Category(

      name: 'BCD',
      specialist: 'Heart',
      experience: 30,
      rating: 4.9,
    ),
    Category(

      name: 'DRE',
      specialist: 'Dental',
      experience: 18,
      rating: 4.8,
    ),
    Category(

      name: 'GRT',
      specialist:'Orthopedist',
      experience: 21,
      rating: 4.9,
    ),
  ];
}
