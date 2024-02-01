# Flutter MVVM Template using Provider
Repository for template using MVVM pattern with Provider.


# Dir Structure
'''
├── lib
│   ├── config
│   │   ├── .env
│   │   ├── api.dart
│   │   ├── app_color.dart
│   │   ├── app_font.dart
│   │   ├── constants.dart
│   │   ├── enum.dart
│   ├── core
│   │   ├── common.dart
│   │   ├── dialog.dart
│   │   ├── toast.dart
│   │   ├── util.dart
│   ├── data
│   │   ├── datasource
│   │   ├── model
│   │   ├── repository
│   ├── view
│   ├── viewmodel
'''
## config
- Files containing setting values for application such as api, color, fonts and etc.
- .env needs "flutter_dotenv" package.
- Displaying UI elements consistently across different screen sizes and resolutions, use "flutter_screenutil" package.

## core
- A set of functions(toast, dialog and etc) used globally in an application.
- toast needs "flutter_toast" package.

## Data
- A set of files to precess data in application.
- It includes data source, model, repository.
### Data Souce
- Perform tasks to connect with internal and external data sources.
    - Remote DataSource: Receive data by communicating with an external server.
    - Local DataSource: Access to mobile phone internal storage data.

### Model
- Class (container) to contain data to be loaded from the server
- Requires implementation of Json methods (fromJson, toJson) for API communication

### Repository
- processes and stores data received from Datasource.
- Elements that ViewModel accesses to receive data.
- One repository must hold only one model data.


# View
- Screen actually shown to the user

# View Model
- Process data connections and events that occur in the view.
- Handles main business logic.
- Receive data by connecting to the repository.
- Use ChangeNotifier to utilize Provider.

# Packages
- cupertino_icons
- intl
- provider
- http
- flutter_screenutil
- logger
- hive
- flutter_dotenv
- json_annotation
- hive_flutter
- fluttertoast
- flutter_svg