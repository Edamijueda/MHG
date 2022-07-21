import 'package:flutter/material.dart';

const String tOSText = 'By registering for an account, you agree that you are '
    'are 21+, have read and accept our ';
//const String membersAgreeText = 'Membership Agreement';
const String validIdIconBtHelpText = 'Valid ID IconButton help is pressed';
const String customerIconBtnHelpText = 'Customer HelpIconButton is pressed';
const String retailerIconBtHelpText = 'Retailer HelpIconButton is pressed';
const String didNotHaveAnyAcc = 'Didn\'t have any account? ';
const String logoutDialogTxt = 'Are you sure you want to logout?';
const String ifYouHaveAnAccount = 'If you have an account? ';
const String appMotto = 'Healing the Nation\'s Capital';
const String displayedAppName = ' Most High Grade';
const String forgetPassword = 'Forget Password';
const String appName = 'Most\nHigh\nGrade';
const String signUpHere = 'Sign Up here';
const String signInHere = 'Sign in here';
const String firstTierTxt = '1st Tier';
const String secondTierTxt = '2nd Tier';
const String thirdTierTxt = '3rd Tier';
const String firstTierArtworkTxt = 'firstTierArtwork';
const String secondTierArtworkTxt = 'secondTierArtwork';
const String thirdTierArtworkTxt = 'thirdTierArtwork';
const String emailHintTxt = 'Valid Email';
const String passwordHintText = 'Password';
const String priceHintTxt = '\$Price';
const String priceTxt = 'price';
const String customTitleTxt = 'customTitle';
const String deviceTypeTxt = 'deviceType';
const String idTxt = 'id';
const String titleTxt = 'title';
const String searchItemHintTxt = 'Search item';
const String descHintTxt = 'write short description';
const String signUpAsCustomer = 'signUp as Customer';
const String signUpAsRetailer = 'signUp as Retailer';
const String choiceOfArtworkTxt = 'Choice of ArtWork';
const String manageArtworkTxt = 'Manage Artwork';
const String customerTxt = 'Customer';
const String tempRetailer = '   Retailer'; // This will be removed later
const String retailerTxt = 'Retailer';
const String artworkTxt = 'Artworks';
//const String bannerTxt = 'Banners';

// Models constants
const String artworkUrlTxt = 'artworkUrl';
const String deviceUrlTxt = 'deviceUrl';
const String descTxt = 'description';
const String bannerUrlTxt = 'bannerUrl';
const String bannerNameTxt = 'bannerName';
// model class SignupRequest constants
const String firstNorBizOwnerNTxt = 'firstNorBizOwnerN';
const String lastNorBizNTxt = 'lastNorBizN';
const String emailTxt = 'email';
const String passwordTxt = 'password';
const String dobOrBizLicenseNoTxt = 'dobOrBizLicenseNo';
const String validIdCardTxt = 'validIdCard';
const String userTypeTxt = 'userType';
const String uidTxt = 'uid';
const String vIdStoragePathTxt = 'vIdStoragePath';
// model class SignupRequest Firebase constants
const String validIdCardsTxt = 'ValidIdCards'; // used as storage folder title
const String signupReqPathTxt = 'signupRequests'; // used as fireStore coll name
const String approvedUsersPathTxt = 'approvedUsers'; // as fireStore coll name
// model class UserProfile constants
const String profilePicTxt = 'profilePic';
const String phoneNoTxt = 'phoneNo';
const String cartItemsTxt = 'cartItems';
// model class UserProfile Firebase constants
const String usersProfilePathTxt = 'usersProfile'; // as fireStore coll name
const String profPicsPathTxt = 'ProfPics'; // used as storage folder title

const String signIn = 'SIGN IN';
const String upload = 'Upload...';
const String tapToAddTxt = 'Tap to add';
const String saveBannerTxt = 'Save';
const String removeBannerTxt = 'Remove';
const String firstNameHintTxt = 'First name';
const String seeAllTxt = 'See All';
const String addTxt = 'Add';
const String logoutTxt = 'Log out';
const String lastNameHintText = 'Last name';
const String dobHintText = 'DOB (dd/mm/yyyy)';
const String validIdHintText = 'Valid ID';
const String bizOwnerHintText = 'Biz Owner\'s Name';
const String businessNameHintText = 'Business Name';
const String businessLNHintText = 'Business License Number';
const String basicPkgTxt = '          Most High Grade Basic Package';
const String standPkgTxt = '          Most High Grade Standard Package';
const String premPkgTxt = '          Most High Grade Premium Package';
const String whatYouGetTxt = '             what you get:';
const String ottoMillAndFillTxt = 'Otto Mill & Fill';
const String electricDabRigTxt = 'Rok Electric Dab rig';
const String herbGrinderTxt = 'Herb & Stash Jar';
const String ottoMillFillGrinderTxt = 'Otto Mill Grinder';

const String flowerTxt = 'Flowers';
const String cartTxt = 'Carts';
const String edibleTxt = 'Edibles';
const String extractTxt = 'Extracts';
const String gearTxt = 'Gears/Merchs';
const String dialogDescAddBannerTxt =
    'If any, the banner in the database will be '
    'overridden.';
const String dialogDescDelProductTxt =
    'you are about to delete this product from database';

// Customer Devices fireStore folder name
const String pipeDbPathTxt = 'PipeDevices';
const String grinderDbPathTxt = 'GrinderDevices';
const String rollerDbPathTxt = 'RollerDevices';
const String tasterDbPathTxt = 'TasterDevices';
const String bongDbPathTxt = 'BongDevices';
const String dabRingDbPathTxt = 'DabRingDevices';
const String bubbleDbPathTxt = 'BubbleDevices';
// Customer Devices fireStore folder name
const String flowerDbPathTxt = 'FlowerDevices';
const String cartDbPathTxt = 'CartridgeDevices';
const String edibleDbPathTxt = 'EdibleDevices';
const String extractDbPathTxt = 'ExtractDevices';
const String gearMerchDbPathTxt = 'gearMerchDevices';

// Firebase/cloud storage constants
const String bannerTxt = 'Banners';
const String deviceTxt = 'Devices';
const String retailDevicePathTxt = 'RetailDevices';

const String review = '4.6 86 Reviews';

const double prefixIconSize = 24.0;
const double iconBtnSize = 18.0; // Used by TextField
final BorderRadius borderRadius10 =
    BorderRadius.circular(10.0); //.all(const Radius.circular(10.0));

const Size sizeW326H50 = Size(326.0, 50.0); // Used by UserAccess,
const Size sizeW326H30 = Size(326.0, 30.0);
const Size sizeW165H30 = Size(165.0, 30.0);
const Size sizeW250H100 = Size(250.0, 100.0);
const Size overrideMinSize = Size(64.0, 25.0); //Default was 64.0, 36.0
const Size uploadBtSize = Size(100.0, 25.0);

// List constants
const List<Tab> tabs = [
  Tab(text: 'Pipes'),
  Tab(text: 'Grinders'),
  Tab(text: 'Rollers'),
  Tab(text: 'Tasters'),
  Tab(text: 'Bongs'),
  Tab(text: 'Dab Rings'),
  Tab(text: 'Bubblers'),
];
