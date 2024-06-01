import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_planner360/features/home/model/category_model.dart';
import '../../../core/constants/app_images.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);
  TextEditingController searchCategoriesController=TextEditingController();
  TextEditingController searchSingleCategoriesController=TextEditingController();
  TextEditingController searchAttractionsController=TextEditingController();
  List<CategoryModel> searchCategories = [];
  List<TouristPlaceModel> searchSingleCategories = [];
  List<AttractionsModel> searchAttractions = [];
  List<CategoryModel> categories = [
    CategoryModel(
      image: AppImages.touristCategory,
      name: 'Tourist Attractions',
      touristPlaces: [
        TouristPlaceModel(
          image: AppImages.talPasta,
          name: 'Tal Basta',
          attractions: [
            AttractionsModel(
                image: AppImages.talPasta6,
                name: 'Oil lamps',
                details:
                '''Egypt in the pre dynasties period produced pottery of very high quality: The Egyptians were one of the find cultures in the world to create pottery and the pottery was one of the oldest crafts known. Ancient Egyptian pottery made of the mud of the Nalle: pottery used for thee clalily lives and as a central feature in tombs as well,\nThe vil lamp is one of the oldest inventions of mankind, it is a form of lighting and a crucial part of life. The ant Egyptians, Greeks and Komuns ured oil lamp in death ritual and other religious ceremoniesc it was sned in Egyet brom the polemics period till blamic period and developed over the time. The following are the main external parts of this kind of lamp''',
                images3d: [
                  AppImages.talPasta3d1,
                  AppImages.talPasta3d2,
                  AppImages.talPasta3d3,
                ]),
            AttractionsModel(
                image: AppImages.talPasta5,
                name: 'Jewellery and adornment',
                details:
                '''The ancient Egyptians were very particular about cleanliness and personal appearance in all the occasions. Cosmetics were an important part of the ancient Egyptian costume. Several objects found in Egyptian tomb reflect the types of adornment they used such as wigs, various cosmetics tools, oils, perfumes, Bracelets, Buttons, Ear rings and ear studs, Necklaces and collars. Adornment used either for social status, or religious beliefs. Ancient Egyptians took great care of their hair; Egyptians hair type displaying an array of many differing hair colours; they used Hena, a potent natural dye for colouring aspects. Egyptians used Galena eye paint (later termed Kohl in Arabic). Kohl was originally used as protection against eye ailments''',
                images3d: [
                  AppImages.talPasta3d1,
                  AppImages.talPasta3d2,
                  AppImages.talPasta3d3,
                ]),
            AttractionsModel(
                image: AppImages.talPasta4,
                name: 'Scarab',
                details:
                '''The Scarab was an important symbol in ancient Egyptian religion that was taken the form of the dung beetle, which lays its eggs in dung balls fashioned through rolling, and the sun helps in the process their rebirth. The scarab bug symbolized the restoration of life and used as a symbol of death and rebirth. It had cosmological significance in Ancient Egypt. The scarab beetle was one of the most popular amulets and seals. Several New kingdoms kings used such scarabs for recording annual occasions such as formal marriage or daily life ceremonies.''',
                images3d: [
                  AppImages.talPasta3d1,
                  AppImages.talPasta3d2,
                  AppImages.talPasta3d3,
                ]),
            AttractionsModel(
                image: AppImages.talPasta3,
                name: 'Clay Terracotta statues',
                details:
                '''The terracotta was more frequently used in Hellenistic Greece period 14 B.C). In Egypt, the terracotta was more frequently produced in Alexan dria and El Fayiom; usually made from a fairly coarse, porous type of clay. Terracotta objects are far simpler and cheaper to create. The word Terracotta (baked earth") is most commonly used to describe a type of sculpture that presented several shapes such as men, children and women; the most common shape was the female figurines.''',
                images3d: [
                  AppImages.talPasta3d1,
                  AppImages.talPasta3d2,
                  AppImages.talPasta3d3,
                ]),
            AttractionsModel(
                image: AppImages.talPasta2,
                name: 'Coins',
                details:
                '''The Egyptians used the currency in commercial transactions with the countries of Asia and the Greeks since the late period. Various reforms about currency used in Egypt, trading, and finances were undertaken over the course of centuries. In ancient Egypt, Most daily tramactions were based on oral agreements: The Egyptians used non-coin forms of silver and gold or food, and Trade was done by barter, a reasonably efficient method when mostly basic necessities were exchange and a great military general, who succeeded in creating one lexander the Great, king of Macedonia argest empires of all time, set the first coins entity in Egypt which was founded in Alexandria 336B.C. The Alexander coin has the image of Alexander on the front (obverse). On the back (reverse), Greek and Egyptian holy slogans were represented.''',
                images3d: [
                  AppImages.talPasta3d1,
                  AppImages.talPasta3d2,
                  AppImages.talPasta3d3,
                ]),
            AttractionsModel(
                image: AppImages.talPasta1,
                name: 'Sharqia Governorate Excavations',
                details:
                '''Sharqia Governorate Excavations\nSince the beginning of the twentieth century, archaeological excavations have been conducted in Sharqia Governorate. The French Egyptologist Pierre Montet (1885-1966) excavated "Tanis known now as "San El-Hagar in 1939 and 1940 where he discovered the Temple of god "Amun" and some of the royal Late Period tombs such as the tombs of Kings "Psusennes I" and "Shosheng 11. In 2009 the French-Egyptian joint mission discovered the location of the sacred lake of the goddess "Mut's temple, which is the second sacred lake revealed in the area,
             ''',
                images3d: [
                  AppImages.talPasta3d1,
                  AppImages.talPasta3d2,
                  AppImages.talPasta3d3,
                ]),
          ],
        ),
        TouristPlaceModel(
          image: AppImages.sanElHagar,
          name: 'San Hajar',
          attractions: [
            AttractionsModel(
                image: AppImages.sanElHagar4,
                name: 'Obelisk',
                details:
                '''A tower and a thin vertical stone column with four sides and ending in a small pyramid, the ancient Egyptian Pharaonic civilization was famous for. Hieroglyphs and royal and religious drawings were carved on its ribs, but it was also found in other civilizations such as Abyssinian, Assyrian, Roman, and Byzantine. The Hammurabi Obelisk is the Code of Hammurabi in ancient Iraq and is the oldest obelisk on which laws and legislation are written in the history of human civilization.''',
                images3d: [
                  AppImages.sanElHagar3d1,
                  AppImages.sanElHagar3d2,
                  AppImages.sanElHagar3d3
                ]),
            AttractionsModel(
                image: AppImages.sanElHagar5,
                name: 'The tomb of King Shosheng III',
                details:
                '''The tomb of King Shosheng III is the fifth tomb found by Pierre Montet in the Tanis royal necropolis between 1939 and 1946. It was excavated in the spring of 1940. Shosheng III, successor of Osorkon II who is also buried Tais (Tomb I), was the sixth ruler of the XXIInd Dynasty and ruled for more forty years during the 9th century BC, mainly in Lower Egypt. At Tanis, he contructed a new monumen al granite gate for the temple of Amun, and the circular mestone well in the temple's first court, northeast of the royal necropolis.''',
                images3d: [
                  AppImages.sanElHagar3d1,
                  AppImages.sanElHagar3d2,
                  AppImages.sanElHagar3d3
                ]),
            AttractionsModel(
                image: AppImages.sanElHagar3,
                name: 'Tanis',
                details:
                '''Sharqia Governorate Excavations\nSince the beginning of the twentieth century, archaeological excavations have been conducted in Sharqia Governorate. The French Egyptologist Pierre Montet (1885-1966) excavated "Tanis known now as "San El-Hagar in 1939 and 1940 where he discovered the Temple of god "Amun" and some of the royal Late Period tombs such as the tombs of Kings "Psusennes I" and "Shosheng 11. In 2009 the French-Egyptian joint mission discovered the location of the sacred lake of the goddess "Mut's temple, which is the second sacred lake revealed in the area,''',
                images3d: [
                  AppImages.sanElHagar3d1,
                  AppImages.sanElHagar3d2,
                  AppImages.sanElHagar3d3
                ]),
            AttractionsModel(
                image: AppImages.sanElHagar1,
                name: 'Linen plant',
                details:
                '''And his plant was taken while flowering a badge indicating the tribal face because of its large growth in it.It was used in building the houses of the poor people and its flowers were working energies since the predynastic era,It is used in the paper industry.''',
                images3d: [
                  AppImages.sanElHagar3d1,
                  AppImages.sanElHagar3d2,
                  AppImages.sanElHagar3d3
                ]),
            AttractionsModel(
                image: AppImages.sanElHagar2,
                name: 'Lotus plant',
                images3d: [
                  AppImages.sanElHagar3d1,
                  AppImages.sanElHagar3d2,
                  AppImages.sanElHagar3d3
                ]),
            AttractionsModel(
                image: AppImages.sanElHagar6,
                name: 'Papyrus plant',
                details:
                '''Papyrus is an aquatic flowering plant belonging to the family of Saadia papyrus. It is a perennial and tender herbaceous plant native to Africa, forming high rows when grown in groups resembling reeds or linen submerged in shallow water. The papyrus plant has a long history in terms of use, especially by the ancient Egyptians, as it is the main ingredient in the manufacture of papyrus and is the first leaf that has been made throughout history. In addition, there are parts of the plant that can be eaten, and boats can be made of high floating stems.''',
                images3d: [
                  AppImages.sanElHagar3d1,
                  AppImages.sanElHagar3d2,
                  AppImages.sanElHagar3d3
                ]),
          ],
        ),
      ],
    ),
    CategoryModel(
      image: AppImages.churchesCategory,
      name: 'Churches',
      touristPlaces: [
        TouristPlaceModel(
          image: AppImages.marioHana1,
          name: 'Mariohanna',
          attractions: [
            AttractionsModel(
                image: AppImages.marioHana1,
                images3d: [AppImages.marioHana3d1, AppImages.marioHana3d2]),
            AttractionsModel(
                image: AppImages.marioHana2,
                images3d: [AppImages.marioHana3d1, AppImages.marioHana3d2]),
            AttractionsModel(
                image: AppImages.marioHana3,
                images3d: [AppImages.marioHana3d1, AppImages.marioHana3d2]),
            AttractionsModel(
                image: AppImages.marioHana4,
                images3d: [AppImages.marioHana3d1, AppImages.marioHana3d2]),
            AttractionsModel(
                image: AppImages.marioHana5,
                images3d: [AppImages.marioHana3d1, AppImages.marioHana3d2]),
            AttractionsModel(
                image: AppImages.marioHana6,
                images3d: [AppImages.marioHana3d1, AppImages.marioHana3d2]),
          ],
        ),
        TouristPlaceModel(
          image: AppImages.mariGirgis1,
          name: 'Mary Girgis',
          attractions: [
            AttractionsModel(image: AppImages.mariGirgis1, images3d: [
              AppImages.mari_girgis_3d1,
              AppImages.mari_girgis_3d2
            ]),
            AttractionsModel(image: AppImages.mariGirgis2, images3d: [
              AppImages.mari_girgis_3d1,
              AppImages.mari_girgis_3d2
            ]),
            AttractionsModel(image: AppImages.mariGirgis3, images3d: [
              AppImages.mari_girgis_3d1,
              AppImages.mari_girgis_3d2
            ]),
            AttractionsModel(image: AppImages.mariGirgis4, images3d: [
              AppImages.mari_girgis_3d1,
              AppImages.mari_girgis_3d2
            ]),
            AttractionsModel(image: AppImages.mariGirgis5, images3d: [
              AppImages.mari_girgis_3d1,
              AppImages.mari_girgis_3d2
            ]),
            AttractionsModel(image: AppImages.mariGirgis6, images3d: [
              AppImages.mari_girgis_3d1,
              AppImages.mari_girgis_3d2
            ]),
          ],
        ),
      ],
    ),
    CategoryModel(
      image: AppImages.mosquesCategory,
      name: 'Mosques',
      touristPlaces: [
        TouristPlaceModel(
          image: AppImages.mosquesCategory,
          name: 'Al-Fath Mosque',
          attractions: [
            AttractionsModel(
                image: AppImages.mosques1, images3d: [AppImages.mosques3d]),
            AttractionsModel(
                image: AppImages.mosques2, images3d: [AppImages.mosques3d]),
            AttractionsModel(
                image: AppImages.mosques3, images3d: [AppImages.mosques3d]),
            AttractionsModel(
                image: AppImages.mosques4, images3d: [AppImages.mosques3d]),
            AttractionsModel(
                image: AppImages.mosques5, images3d: [AppImages.mosques3d]),
            AttractionsModel(
                image: AppImages.mosques6, images3d: [AppImages.mosques3d]),
          ],
        )
      ],
    ),
    CategoryModel(
        image: AppImages.restaurantCategory,
        name: 'Restaurants & Cafes',
        touristPlaces: [
          TouristPlaceModel(
              image: AppImages.heartAttack1,
              name: 'Heart Attack',
              attractions: [
                AttractionsModel(image: AppImages.heartAttack1,images3d: [AppImages.heartAttack3d]),
                AttractionsModel(image: AppImages.heartAttack2,images3d: [AppImages.heartAttack3d]),
                AttractionsModel(image: AppImages.heartAttack3,images3d: [AppImages.heartAttack3d]),
                AttractionsModel(image: AppImages.heartAttack4,images3d: [AppImages.heartAttack3d]),
                AttractionsModel(image: AppImages.heartAttack5,images3d: [AppImages.heartAttack3d]),
                AttractionsModel(image: AppImages.heartAttack6,images3d: [AppImages.heartAttack3d]),
              ]),
          TouristPlaceModel(
              image: AppImages.theCHouse1,
              name: 'The C House',
              attractions: [
                AttractionsModel(image: AppImages.theCHouse1),
                AttractionsModel(image: AppImages.theCHouse2),
                AttractionsModel(image: AppImages.theCHouse3),
                AttractionsModel(image: AppImages.theCHouse4),
                AttractionsModel(image: AppImages.theCHouse5),
                AttractionsModel(image: AppImages.theCHouse6),
              ])
        ]),

  ];

  void searchInCategories(String value){
      emit(SearchCategoriesLoadingState());
      searchCategories.clear();
      for( var i in categories ){
        if((i.name).trim().toLowerCase().contains(value.trim().toLowerCase())){
          searchCategories.add(i);
        }
      }
      emit(SearchCategoriesSuccessState());
  }

  void searchInSingleCategories(String value,List<TouristPlaceModel> touristList){
    searchSingleCategories.clear();
      emit(SearchSingleCategoriesLoadingState());
      for( var i in touristList){
        if((i.name).trim().toLowerCase().contains(value.trim().toLowerCase())){
          searchSingleCategories.add(i);
        }
      }
      emit(SearchSingleCategoriesSuccessState());
  }
  void searchInAttractions(String value,List<AttractionsModel> attractionsList){
    searchAttractions.clear();
      emit(SearchAttractionsLoadingState());
      for( var i in attractionsList ){
        if((i.name??'').trim().toLowerCase().contains(value.trim().toLowerCase())){
          searchAttractions.add(i);
        }
      }
      emit(SearchAttractionsSuccessState());
  }

}
