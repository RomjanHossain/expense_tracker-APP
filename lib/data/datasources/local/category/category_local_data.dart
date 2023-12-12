import 'package:expense_tracker/data/models/category_model.dart';
import 'package:expense_tracker/data/models/local_db_model/category_local_db_model.dart';

final categoryLocalData = <String, CategoryLocalModel>{
  'Housing':
      //   'Mortgage or rent': '🏠',
      //   'Property taxes': '🏡',
      //   'Household repairs': '🔧',
      //   'HOA fees': '🏘️',
      //   'Home improvements or renovations': '🔨',
      //   'Home cleaning services': '🧹', },
      const CategoryLocalModel(
    id: 'housing',
    title: 'Housing',
    items: [
      CategoryModel(id: 'mortgageRent', title: 'Mortgage or rent', icon: '🏠'),
      CategoryModel(id: 'propertyTaxes', title: 'Property taxes', icon: '🏡'),
      CategoryModel(
        id: 'householdRepairs',
        title: 'Household repairs',
        icon: '🔧',
      ),
      CategoryModel(id: 'hoaFees', title: 'HOA fees', icon: '🏘️'),
      CategoryModel(
        id: 'homeImprovements',
        title: 'Home improvements or renovations',
        icon: '🔨',
      ),
      CategoryModel(
        id: 'homeCleaningServices',
        title: 'Home cleaning services',
        icon: '🧹',
      ),
    ],
  ),
  'Transportation':
      //
      //<String, String>{
      //   'Car payment': '🚗',
      //   'Car warranty': '🛠️',
      //   'Gas': '⛽',
      //   'Tires': '🚘',
      //   'Maintenance and oil changes': '🔧',
      //   'Parking fees': '🅿️',
      //   'Repairs': '🔧',
      //   'Registration and DMV Fees': '🚗',
      //   'Public transportation expenses': '🚎',
      //   'Ride-sharing or taxi expenses': '🚕',
      // },
      const CategoryLocalModel(
    id: 'transportation',
    title: 'Transportation',
    items: [
      CategoryModel(id: 'carPayment', title: 'Car payment', icon: '🚗'),
      CategoryModel(id: 'carWarranty', title: 'Car warranty', icon: '🛠️'),
      CategoryModel(id: 'gas', title: 'Gas', icon: '⛽'),
      CategoryModel(id: 'tires', title: 'Tires', icon: '🚘'),
      CategoryModel(
        id: 'maintenanceOilChanges',
        title: 'Maintenance and oil changes',
        icon: '🔧',
      ),
      CategoryModel(id: 'parkingFees', title: 'Parking fees', icon: '🅿️'),
      CategoryModel(id: 'repairs', title: 'Repairs', icon: '🔧'),
      CategoryModel(
        id: 'registrationDmvFees',
        title: 'Registration and DMV Fees',
        icon: '🚗',
      ),
      CategoryModel(
        id: 'publicTransportationExpenses',
        title: 'Public transportation expenses',
        icon: '🚎',
      ),
      CategoryModel(
        id: 'rideSharingTaxiExpenses',
        title: 'Ride-sharing or taxi expenses',
        icon: '🚕',
      ),
    ],
  ),
  'Food':
// <String, String>{
//     'Groceries': '🛒',
//     'Restaurants': '🍽️',
//     'Pet food': '🐾',
//   },
      const CategoryLocalModel(
    id: 'food',
    title: 'Food',
    items: [
      CategoryModel(id: 'groceries', title: 'Groceries', icon: '🛒'),
      CategoryModel(id: 'restaurants', title: 'Restaurants', icon: '🍽️'),
      CategoryModel(id: 'petFood', title: 'Pet food', icon: '🐾'),
    ],
  ),
  'Utilities':
// <String, String>{
//     'Electricity': '💡',
//     'Water': '🚿',
//     'Garbage': '🗑️',
//     'Phones': '📞',
//     'Cable': '📺',
//     'Internet': '🌐',
//   },
      const CategoryLocalModel(
    id: 'utilities',
    title: 'Utilities',
    items: [
      CategoryModel(id: 'electricity', title: 'Electricity', icon: '💡'),
      CategoryModel(id: 'water', title: 'Water', icon: '🚿'),
      CategoryModel(id: 'garbage', title: 'Garbage', icon: '🗑️'),
      CategoryModel(id: 'phones', title: 'Phones', icon: '📞'),
      CategoryModel(id: 'cable', title: 'Cable', icon: '📺'),
      CategoryModel(id: 'internet', title: 'Internet', icon: '🌐'),
    ],
  ),
  'Clothing':
      //  <String, String>{
      //   'Adults’ clothing': '👚',
      //   'Adults’ shoes': '👠',
      //   'Children’s clothing': '👕',
      //   'Children’s shoes': '👟',
      // },
      const CategoryLocalModel(
    id: 'clothing',
    title: 'Clothing',
    items: [
      CategoryModel(
        id: 'adultsClothing',
        title: 'Adults’ clothing',
        icon: '👚',
      ),
      CategoryModel(id: 'adultsShoes', title: 'Adults’ shoes', icon: '👠'),
      CategoryModel(
        id: 'childrensClothing',
        title: 'Children’s clothing',
        icon: '👕',
      ),
      CategoryModel(
        id: 'childrensShoes',
        title: 'Children’s shoes',
        icon: '👟',
      ),
    ],
  ),
  'Medical/Healthcare':
      //  <String, String>{
      //   'Primary care': '⚕️',
      //   'Dental care': '🦷',
      //   'Specialty care (dermatologists, orthodontics, optometrists, etc.)':
      //       '👩‍⚕️',
      //   'Urgent care': '🚑',
      //   'Medications': '💊',
      //   'Medical devices': '🩺',
      //   'Health savings account (HSA) contributions or expenses': '💳⚕️',
      //   'Vision care expenses': '👓',
      // },
      const CategoryLocalModel(
    id: 'medicalHealthcare',
    title: 'Medical/Healthcare',
    items: [
      CategoryModel(id: 'primaryCare', title: 'Primary care', icon: '⚕️'),
      CategoryModel(id: 'dentalCare', title: 'Dental care', icon: '🦷'),
      CategoryModel(
        id: 'specialtyCare',
        title:
            'Specialty care (dermatologists, orthodontics, optometrists, etc.)',
        icon: '👩‍⚕️',
      ),
      CategoryModel(id: 'urgentCare', title: 'Urgent care', icon: '🚑'),
      CategoryModel(id: 'medications', title: 'Medications', icon: '💊'),
      CategoryModel(id: 'medicalDevices', title: 'Medical devices', icon: '🩺'),
      CategoryModel(
        id: 'hsaContributionsExpenses',
        title: 'Health savings account (HSA) contributions or expenses',
        icon: '💳⚕️',
      ),
      CategoryModel(
        id: 'visionCareExpenses',
        title: 'Vision care expenses',
        icon: '👓',
      ),
    ],
  ),
  'Insurance':
      // <String, String>{
      //   'Health insurance': '🩺🔒',
      //   'Homeowner’s or renter’s insurance': '🏠🔒',
      //   'Home warranty or protection plan': '🔒🏡',
      //   'Auto insurance': '🚗🔒',
      //   'Life insurance': '💼🔒',
      //   'Disability insurance': '♿🔒',
      // },
      const CategoryLocalModel(
    id: 'insurance',
    title: 'Insurance',
    items: [
      CategoryModel(
        id: 'healthInsurance',
        title: 'Health insurance',
        icon: '🩺🔒',
      ),
      CategoryModel(
        id: 'homeownersRentersInsurance',
        title: 'Homeowner’s or renter’s insurance',
        icon: '🏠🔒',
      ),
      CategoryModel(
        id: 'homeWarrantyProtectionPlan',
        title: 'Home warranty or protection plan',
        icon: '🔒🏡',
      ),
      CategoryModel(id: 'autoInsurance', title: 'Auto insurance', icon: '🚗🔒'),
      CategoryModel(id: 'lifeInsurance', title: 'Life insurance', icon: '💼🔒'),
      CategoryModel(
        id: 'disabilityInsurance',
        title: 'Disability insurance',
        icon: '♿🔒',
      ),
    ],
  ),
  'Household Items/Supplies':
// <String, String>{
//     'Toiletries': '🧼',
//     'Laundry detergent': '🧺',
//     'Dishwasher detergent': '🍽️',
//     'Cleaning supplies': '🧹',
//     'Tools': '🔧',
//   },
      const CategoryLocalModel(
    id: 'householdItemsSupplies',
    title: 'Household Items/Supplies',
    items: [
      CategoryModel(id: 'toiletries', title: 'Toiletries', icon: '🧼'),
      CategoryModel(
        id: 'laundryDetergent',
        title: 'Laundry detergent',
        icon: '🧺',
      ),
      CategoryModel(
        id: 'dishwasherDetergent',
        title: 'Dishwasher detergent',
        icon: '🍽️',
      ),
      CategoryModel(
        id: 'cleaningSupplies',
        title: 'Cleaning supplies',
        icon: '🧹',
      ),
      CategoryModel(id: 'tools', title: 'Tools', icon: '🔧'),
    ],
  ),
  'Personal': const CategoryLocalModel(
    id: 'personal',
    title: 'Personal',
    items: [
      CategoryModel(
        id: 'gymMemberships',
        title: 'Gym memberships',
        icon: '🏋️',
      ),
      CategoryModel(id: 'haircuts', title: 'Haircuts', icon: '💇'),
      CategoryModel(id: 'salonServices', title: 'Salon services', icon: '💅'),
      CategoryModel(
        id: 'cosmetics',
        title: 'Cosmetics (like makeup or services like laser hair removal)',
        icon: '💄',
      ),
      CategoryModel(id: 'babysitter', title: 'Babysitter', icon: '👶🍼'),
      CategoryModel(id: 'subscriptions', title: 'Subscriptions', icon: '📰'),
      CategoryModel(
        id: 'hobbiesRecreationalActivities',
        title: 'Hobbies or recreational activities expenses',
        icon: '🎨',
      ),
      CategoryModel(
        id: 'selfImprovementPersonalDevelopment',
        title: 'Self-improvement or personal development expenses',
        icon: '📚',
      ),
    ],
  ),
// <String, String>{
//     'Gym memberships': '🏋️',
//     'Haircuts': '💇',
//     'Salon services': '💅',
//     'Cosmetics (like makeup or services like laser hair removal)': '💄',
//     'Babysitter': '👶🍼',
//     'Subscriptions': '📰',
//     'Hobbies or recreational activities expenses': '🎨',
//     'Self-improvement or personal development expenses': '📚',
//   },
  'Debt': const CategoryLocalModel(
    id: 'debt',
    title: 'Debt',
    items: [
      CategoryModel(id: 'personalLoans', title: 'Personal loans', icon: '💳'),
      CategoryModel(id: 'studentLoans', title: 'Student loans', icon: '🎓💰'),
      CategoryModel(id: 'creditCards', title: 'Credit cards', icon: '💳'),
      CategoryModel(
        id: 'otherTypesOfLoans',
        title: 'Other types of loans',
        icon: '💰',
      ),
    ],
  ),
// <String, String>{
//     'Personal loans': '💳',
//     'Student loans': '🎓💰',
//     'Credit cards': '💳',
//     'Other types of loans': '💰',
//   },
  'Retirement': const CategoryLocalModel(
    id: 'retirement',
    title: 'Retirement',
    items: [
      CategoryModel(
        id: 'financialPlanning',
        title: 'Financial planning',
        icon: '💹',
      ),
      CategoryModel(id: 'investing', title: 'Investing', icon: '💰'),
      CategoryModel(
        id: 'continuingEducationExpenses',
        title:
            'Continuing education expenses for personal or career development',
        icon: '📚',
      ),
    ],
  ),
// <String, String>{
//     'Financial planning': '💹',
//     'Investing': '💰',
//     'Continuing education expenses for personal or career development': '📚',
//   },
  'Education':
// <String, String>{
//     'Children’s college': '👨‍🎓',
//     'Your college': '👩‍🎓',
//     'School supplies': '📓',
//     'Books': '📚',
//   },
      const CategoryLocalModel(
    id: 'education',
    title: 'Education',
    items: [
      CategoryModel(
        id: 'childrensCollege',
        title: 'Children’s college',
        icon: '👨‍🎓',
      ),
      CategoryModel(id: 'yourCollege', title: 'Your college', icon: '👩‍🎓'),
      CategoryModel(id: 'schoolSupplies', title: 'School supplies', icon: '📓'),
      CategoryModel(id: 'books', title: 'Books', icon: '📚'),
    ],
  ),
  'Savings':
      //  <String, String>{
      //   'Emergency fund': '💰',
      //   'Big purchases like a new mattress or laptop': '💻',
      //   'Other savings': '💰',
      //   'Specific savings goals (e.g., travel fund, home down payment)': '🎯',
      // },
      const CategoryLocalModel(
    id: 'savings',
    title: 'Savings',
    items: [
      CategoryModel(id: 'emergencyFund', title: 'Emergency fund', icon: '💰'),
      CategoryModel(
        id: 'bigPurchases',
        title: 'Big purchases like a new mattress or laptop',
        icon: '💻',
      ),
      CategoryModel(id: 'otherSavings', title: 'Other savings', icon: '💰'),
      CategoryModel(
        id: 'specificSavingsGoals',
        title: 'Specific savings goals (e.g., travel fund, home down payment)',
        icon: '🎯',
      ),
    ],
  ),
  'Gifts/Donations':
      //  <String, String>{
      //   'Birthday': '🎁',
      //   'Anniversary': '🎉',
      //   'Wedding': '💍🎉',
      //   'Christmas': '🎄',
      //   'Special occasion': '🎈',
      //   'Charities': '❤️',
      // },
      const CategoryLocalModel(
    id: 'giftsDonations',
    title: 'Gifts/Donations',
    items: [
      CategoryModel(id: 'birthday', title: 'Birthday', icon: '🎁'),
      CategoryModel(id: 'anniversary', title: 'Anniversary', icon: '🎉'),
      CategoryModel(id: 'wedding', title: 'Wedding', icon: '💍🎉'),
      CategoryModel(id: 'christmas', title: 'Christmas', icon: '🎄'),
      CategoryModel(
        id: 'specialOccasion',
        title: 'Special occasion',
        icon: '🎈',
      ),
      CategoryModel(id: 'charities', title: 'Charities', icon: '❤️'),
    ],
  ),
  'Entertainment':
      //  <String, String>{
      //   'Alcohol and/or bars': '🍻',
      //   'Games': '🎮',
      //   'Movies': '🎬',
      //   'Concerts': '🎵',
      //   'Vacations': '✈️',
      //   'Subscriptions (Netflix, Amazon, Hulu, etc.)': '📺',
      // },
      const CategoryLocalModel(
    id: 'entertainment',
    title: 'Entertainment',
    items: [
      CategoryModel(
        id: 'alcoholBars',
        title: 'Alcohol and/or bars',
        icon: '🍻',
      ),
      CategoryModel(id: 'games', title: 'Games', icon: '🎮'),
      CategoryModel(id: 'movies', title: 'Movies', icon: '🎬'),
      CategoryModel(id: 'concerts', title: 'Concerts', icon: '🎵'),
      CategoryModel(id: 'vacations', title: 'Vacations', icon: '✈️'),
      CategoryModel(
        id: 'subscriptions',
        title: 'Subscriptions (Netflix, Amazon, Hulu, etc.)',
        icon: '📺',
      ),
    ],
  ),
};
