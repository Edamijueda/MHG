enum DialogType {
  productEntry,
  productDetails,
  pipeEntry,
  grinderEntry,
  rollerEntry,
  tasterEntry,
  bongEntry,
  dabRingEntry,
  bubbleEntry,
  chooseFlowerType,
  chooseCartType,
  chooseEdibleType,
  chooseExtractType,
  chooseGearAndMerchType,
}

////////////////////////////////////////////////////////////////////////////////
// Enums use for the 5 retail TabBar
////////////////////////////////////////////////////////////////////////////////
enum Flowers {
  designers,
  midGrade,
  lightDepthPremium,
  lightDepth,
  affordable,
  shakes,
  dcHarvest,
  organic
}
// Flowers tab, sub-category strings
const String designFlowerTxt = 'Designer Flowers';
const String midGradeTxt = 'Mid Grade';
const String lightDepthPremiumTxt = 'Light Depth Premium';
const String lightDepthTxt = 'Light Depth';
const String affordableTxt = 'Affordable';
const String shakeTxt = 'Shakes';
const String dcHarvestTxt = 'DC Harvest';
const String organicTxt = 'Organic';

enum Carts {
  cbdCart,
  delta8Cart,
  thcCart,
}
// Carts tab, sub-category strings
const String cbdCartTxt = 'CBD Carts';
const String delta8CartTxt = 'Delta8 Carts';
const String thcCartTxt = 'THC Carts';

enum Edibles {
  candy,
  chocolate,
  bummies,
  honey,
  cake,
  drink,
  cannabudder,
  oils,
  capsule,
  edibleDistillate
}
// Edibles tab, sub-category strings
const String candyTxt = 'Candy';
const String chocolateTxt = 'Chocolate';
const String bummieTxt = 'Bummies';
const String honeyTxt = 'Honey';
const String cakeTxt = 'Cake';
const String drinkTxt = 'Drinks';
const String cannabudderTxt = 'Cannabudder';
const String oilTxt = 'Oils';
const String capsuleTxt = 'Capsule';
const String distillateTxt = 'Distillates';

enum Extracts {
  shatter,
  hash,
  wax,
  kief,
  diamond,
  crumble,
  budder,
  preRoll,
  moonRock,
  extractDistillate,
}
// Extracts tab, sub-category strings
const String shatterTxt = 'Shatter';
const String hashTxt = 'Hash';
const String waxTxt = 'Wax';
const String kiefTxt = 'Kief';
const String diamondTxt = 'Diamond';
const String crumblesTxt = 'Crumbles';
const String budderTxt = 'Budder';
const String preRollTxt = 'PreRolls';
const String moonRockTxt = 'MoonRock';
// Reuse the distillate 'distillateTxt' declared above

enum GearsAndMerch {
  artPrintAndDigital,
  tShirt,
  hoodies,
  accessories,
  socks,
  rollingVaper,
}
// GearsAndMerch tab, sub-category strings
const String artPrintAndDigitalTxt = 'ART-Print&Digital';
const String tShirtTxt = 'T-shirts';
const String hoodiesTxt = 'Hoodies';
//'accessories' on subCat & 'HeadShop Accessories' on Text().I use acc... 4 both
const String accessoriesTxt = 'accessories';
const String socksTxt = 'Socks';
const String rollingVapeTxt = 'Rolling Vapes'; // same as 'vapeTxt'
