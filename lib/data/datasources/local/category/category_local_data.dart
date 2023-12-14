import 'package:expense_tracker/data/models/category_model.dart';
import 'package:expense_tracker/data/models/local_db_model/category_local_db_model.dart';

final categoryLocalData = <String, CategoryLocalModel>{
  'Housing': const CategoryLocalModel(
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
  'Transportation': const CategoryLocalModel(
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
  'Food': const CategoryLocalModel(
    id: 'food',
    title: 'Food',
    items: [
      CategoryModel(id: 'groceries', title: 'Groceries', icon: '🛒'),
      CategoryModel(id: 'restaurants', title: 'Restaurants', icon: '🍽️'),
      CategoryModel(id: 'petFood', title: 'Pet food', icon: '🐾'),
    ],
  ),
  'Utilities': const CategoryLocalModel(
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
  'Clothing': const CategoryLocalModel(
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
  'Medical/Healthcare': const CategoryLocalModel(
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
  'Insurance': const CategoryLocalModel(
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
  'Household Items/Supplies': const CategoryLocalModel(
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
  'Education': const CategoryLocalModel(
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
  'Savings': const CategoryLocalModel(
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
  'Gifts/Donations': const CategoryLocalModel(
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
  'Entertainment': const CategoryLocalModel(
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

final categoryLocalData2 = <CategoryModel>[
  const CategoryModel(
      id: 'mortgageRent', title: 'Mortgage or rent', icon: '🏠'),
  const CategoryModel(id: 'propertyTaxes', title: 'Property taxes', icon: '🏡'),
  const CategoryModel(
    id: 'householdRepairs',
    title: 'Household repairs',
    icon: '🔧',
  ),
  const CategoryModel(id: 'hoaFees', title: 'HOA fees', icon: '🏘️'),
  const CategoryModel(
    id: 'homeImprovements',
    title: 'Home improvements or renovations',
    icon: '🔨',
  ),
  const CategoryModel(
    id: 'homeCleaningServices',
    title: 'Home cleaning services',
    icon: '🧹',
  ),
  const CategoryModel(id: 'carPayment', title: 'Car payment', icon: '🚗'),
  const CategoryModel(id: 'carWarranty', title: 'Car warranty', icon: '🛠️'),
  const CategoryModel(id: 'gas', title: 'Gas', icon: '⛽'),
  const CategoryModel(id: 'tires', title: 'Tires', icon: '🚘'),
  const CategoryModel(
    id: 'maintenanceOilChanges',
    title: 'Maintenance and oil changes',
    icon: '🔧',
  ),
  const CategoryModel(id: 'parkingFees', title: 'Parking fees', icon: '🅿️'),
  const CategoryModel(id: 'repairs', title: 'Repairs', icon: '🔧'),
  const CategoryModel(
    id: 'registrationDmvFees',
    title: 'Registration and DMV Fees',
    icon: '🚗',
  ),
  const CategoryModel(
    id: 'publicTransportationExpenses',
    title: 'Public transportation expenses',
    icon: '🚎',
  ),
  const CategoryModel(
    id: 'rideSharingTaxiExpenses',
    title: 'Ride-sharing or taxi expenses',
    icon: '🚕',
  ),
  const CategoryModel(id: 'groceries', title: 'Groceries', icon: '🛒'),
  const CategoryModel(id: 'restaurants', title: 'Restaurants', icon: '🍽️'),
  const CategoryModel(id: 'petFood', title: 'Pet food', icon: '🐾'),
  const CategoryModel(id: 'electricity', title: 'Electricity', icon: '💡'),
  const CategoryModel(id: 'water', title: 'Water', icon: '🚿'),
  const CategoryModel(id: 'garbage', title: 'Garbage', icon: '🗑️'),
  const CategoryModel(id: 'phones', title: 'Phones', icon: '📞'),
  const CategoryModel(id: 'cable', title: 'Cable', icon: '📺'),
  const CategoryModel(id: 'internet', title: 'Internet', icon: '🌐'),
  const CategoryModel(
    id: 'adultsClothing',
    title: 'Adults’ clothing',
    icon: '👚',
  ),
  const CategoryModel(id: 'adultsShoes', title: 'Adults’ shoes', icon: '👠'),
  const CategoryModel(
    id: 'childrensClothing',
    title: 'Children’s clothing',
    icon: '👕',
  ),
  const CategoryModel(
    id: 'childrensShoes',
    title: 'Children’s shoes',
    icon: '👟',
  ),
  const CategoryModel(id: 'primaryCare', title: 'Primary care', icon: '⚕️'),
  const CategoryModel(id: 'dentalCare', title: 'Dental care', icon: '🦷'),
  const CategoryModel(
    id: 'specialtyCare',
    title: 'Specialty care (dermatologists, orthodontics, optometrists, etc.)',
    icon: '👩‍⚕️',
  ),
  const CategoryModel(id: 'urgentCare', title: 'Urgent care', icon: '🚑'),
  const CategoryModel(id: 'medications', title: 'Medications', icon: '💊'),
  const CategoryModel(
      id: 'medicalDevices', title: 'Medical devices', icon: '🩺'),
  const CategoryModel(
    id: 'hsaContributionsExpenses',
    title: 'Health savings account (HSA) contributions or expenses',
    icon: '💳⚕️',
  ),
  const CategoryModel(
    id: 'visionCareExpenses',
    title: 'Vision care expenses',
    icon: '👓',
  ),
  const CategoryModel(
    id: 'healthInsurance',
    title: 'Health insurance',
    icon: '🩺🔒',
  ),
  const CategoryModel(
    id: 'homeownersRentersInsurance',
    title: 'Homeowner’s or renter’s insurance',
    icon: '🏠🔒',
  ),
  const CategoryModel(
    id: 'homeWarrantyProtectionPlan',
    title: 'Home warranty or protection plan',
    icon: '🔒🏡',
  ),
  const CategoryModel(
      id: 'autoInsurance', title: 'Auto insurance', icon: '🚗🔒'),
  const CategoryModel(
      id: 'lifeInsurance', title: 'Life insurance', icon: '💼🔒'),
  const CategoryModel(
    id: 'disabilityInsurance',
    title: 'Disability insurance',
    icon: '♿🔒',
  ),
  const CategoryModel(id: 'toiletries', title: 'Toiletries', icon: '🧼'),
  const CategoryModel(
    id: 'laundryDetergent',
    title: 'Laundry detergent',
    icon: '🧺',
  ),
  const CategoryModel(
    id: 'dishwasherDetergent',
    title: 'Dishwasher detergent',
    icon: '🍽️',
  ),
  const CategoryModel(
    id: 'cleaningSupplies',
    title: 'Cleaning supplies',
    icon: '🧹',
  ),
  const CategoryModel(id: 'tools', title: 'Tools', icon: '🔧'),
  const CategoryModel(
    id: 'gymMemberships',
    title: 'Gym memberships',
    icon: '🏋️',
  ),
  const CategoryModel(id: 'haircuts', title: 'Haircuts', icon: '💇'),
  const CategoryModel(id: 'salonServices', title: 'Salon services', icon: '💅'),
  const CategoryModel(
    id: 'cosmetics',
    title: 'Cosmetics (like makeup or services like laser hair removal)',
    icon: '💄',
  ),
  const CategoryModel(id: 'babysitter', title: 'Babysitter', icon: '👶🍼'),
  const CategoryModel(id: 'subscriptions', title: 'Subscriptions', icon: '📰'),
  const CategoryModel(
    id: 'hobbiesRecreationalActivities',
    title: 'Hobbies or recreational activities expenses',
    icon: '🎨',
  ),
  const CategoryModel(
    id: 'selfImprovementPersonalDevelopment',
    title: 'Self-improvement or personal development expenses',
    icon: '📚',
  ),
  const CategoryModel(id: 'personalLoans', title: 'Personal loans', icon: '💳'),
  const CategoryModel(id: 'studentLoans', title: 'Student loans', icon: '🎓💰'),
  const CategoryModel(id: 'creditCards', title: 'Credit cards', icon: '💳'),
  const CategoryModel(
    id: 'otherTypesOfLoans',
    title: 'Other types of loans',
    icon: '💰',
  ),
  const CategoryModel(
    id: 'financialPlanning',
    title: 'Financial planning',
    icon: '💹',
  ),
  const CategoryModel(id: 'investing', title: 'Investing', icon: '💰'),
  const CategoryModel(
    id: 'continuingEducationExpenses',
    title: 'Continuing education expenses for personal or career development',
    icon: '📚',
  ),
  const CategoryModel(
    id: 'childrensCollege',
    title: 'Children’s college',
    icon: '👨‍🎓',
  ),
  const CategoryModel(id: 'yourCollege', title: 'Your college', icon: '👩‍🎓'),
  const CategoryModel(
      id: 'schoolSupplies', title: 'School supplies', icon: '📓'),
  const CategoryModel(id: 'books', title: 'Books', icon: '📚'),
  const CategoryModel(id: 'emergencyFund', title: 'Emergency fund', icon: '💰'),
  const CategoryModel(
    id: 'bigPurchases',
    title: 'Big purchases like a new mattress or laptop',
    icon: '💻',
  ),
  const CategoryModel(id: 'otherSavings', title: 'Other savings', icon: '💰'),
  const CategoryModel(
    id: 'specificSavingsGoals',
    title: 'Specific savings goals (e.g., travel fund, home down payment)',
    icon: '🎯',
  ),
  const CategoryModel(id: 'birthday', title: 'Birthday', icon: '🎁'),
  const CategoryModel(id: 'anniversary', title: 'Anniversary', icon: '🎉'),
  const CategoryModel(id: 'wedding', title: 'Wedding', icon: '💍🎉'),
  const CategoryModel(id: 'christmas', title: 'Christmas', icon: '🎄'),
  const CategoryModel(
    id: 'specialOccasion',
    title: 'Special occasion',
    icon: '🎈',
  ),
  const CategoryModel(id: 'charities', title: 'Charities', icon: '❤️'),
  const CategoryModel(
    id: 'alcoholBars',
    title: 'Alcohol and/or bars',
    icon: '🍻',
  ),
  const CategoryModel(id: 'games', title: 'Games', icon: '🎮'),
  const CategoryModel(id: 'movies', title: 'Movies', icon: '🎬'),
  const CategoryModel(id: 'concerts', title: 'Concerts', icon: '🎵'),
  const CategoryModel(id: 'vacations', title: 'Vacations', icon: '✈️'),
  const CategoryModel(
    id: 'subscriptions',
    title: 'Subscriptions (Netflix, Amazon, Hulu, etc.)',
    icon: '📺',
  ),
];
