const questionsList = [
  "What's the super power of Captain America?",
  "Which one of these has a power of Super Speed?",
  "Who is the best archer in the Marvel Universe?",
  "Who is hulk?",
  "What's the Strongest metal in Marvel Universe?",
  "Wolverine's metal claw are made up of?",
  "Who is the king of Wakanda?",
  "The most powerful Telepath in Marvel Universe is: ",
  "Which one of these in Marvel Universe is an immortal?",
  "Who is Spider Man?",
];

const optionsList = [
  [
    {'option': 'Super Speed', 'is_true': false},
    {'option': 'Immortality', 'is_true': false},
    {'option': 'Teleportation', 'is_true': false},
    {'option': 'Super Strenth', 'is_true': true}
  ],
  [
    {'option': 'Quick Silver', 'is_true': true},
    {'option': 'Iron Man', 'is_true': false},
    {'option': 'Black Widow', 'is_true': false},
    {'option': 'Spider Man', 'is_true': false}
  ],
  [
    {'option': 'Kate Bishop', 'is_true': false},
    {'option': 'Hawkeye', 'is_true': true},
    {'option': 'Black Widow', 'is_true': false},
    {'option': 'Iron Fist', 'is_true': false}
  ],
  [
    {'option': 'Bruce Banner', 'is_true': true},
    {'option': 'Peter Parker', 'is_true': false},
    {'option': 'Luke Cage', 'is_true': false},
    {'option': 'Hank MacCoy', 'is_true': false}
  ],
  [
    {'option': 'Uru', 'is_true': false},
    {'option': 'Adamantium', 'is_true': false},
    {'option': 'Vibranium', 'is_true': true},
    {'option': 'Platinum', 'is_true': false}
  ],
  [
    {'option': 'Steel', 'is_true': false},
    {'option': 'Adamantium', 'is_true': true},
    {'option': 'Vibranium', 'is_true': false},
    {'option': 'Platinum', 'is_true': false}
  ],
  [
    {'option': 'Iron Fist', 'is_true': false},
    {'option': 'Black Panther', 'is_true': true},
    {'option': 'Iron Man', 'is_true': false},
    {'option': 'Dare Devil', 'is_true': false}
  ],
  [
    {'option': 'Charles Xaviour', 'is_true': true},
    {'option': 'Emma frost', 'is_true': false},
    {'option': 'Mesmero', 'is_true': false},
    {'option': 'Mastermind', 'is_true': false}
  ],
  [
    {'option': 'Deadpool', 'is_true': true},
    {'option': 'Wolverine', 'is_true': false},
    {'option': 'Captain America', 'is_true': false},
    {'option': 'The Mandarin', 'is_true': false}
  ],
  [
    {'option': 'Peter Parker', 'is_true': true},
    {'option': 'Danny Rand', 'is_true': false},
    {'option': 'Bruce Banner', 'is_true': false},
    {'option': 'Hank MacCoy', 'is_true': false}
  ],
];

const questions = [
  {
    'imageIndex': '01',
    'question': "What's the super power of Captain America?",
    'options': [
      {'option': 'Super Speed', 'is_true': false},
      {'option': 'Immortality', 'is_true': false},
      {'option': 'Teleportation', 'is_true': false},
      {'option': 'Super Strenth', 'is_true': true}
    ],
  },
  {
    'imageIndex': '02',
    'question': "Which one of these has a power of Super Speed?",
    'options': [
      {'option': 'Quick Silver', 'is_true': true},
      {'option': 'Iron Man', 'is_true': false},
      {'option': 'Black Widow', 'is_true': false},
      {'option': 'Spider Man', 'is_true': false}
    ],
  },
  {
    'imageIndex': '03',
    'question': "Who is the best archer in the Marvel Universe?",
    'options': [
      {'option': 'Kate Bishop', 'is_true': false},
      {'option': 'Hawkeye', 'is_true': true},
      {'option': 'Black Widow', 'is_true': false},
      {'option': 'Iron Fist', 'is_true': false}
    ],
  },
  {
    'imageIndex': '04',
    'question': "Who is hulk?",
    'options': [
      {'option': 'Bruce Banner', 'is_true': true},
      {'option': 'Peter Parker', 'is_true': false},
      {'option': 'Luke Cage', 'is_true': false},
      {'option': 'Hank MacCoy', 'is_true': false}
    ],
  },
  {
    'imageIndex': '05',
    'question': "What's the Strongest metal in Marvel Universe?",
    'options': [
      {'option': 'Uru', 'is_true': true},
      {'option': 'Adamantium', 'is_true': false},
      {'option': 'Vibranium', 'is_true': false},
      {'option': 'Platinum', 'is_true': false}
    ],
  },
  {
    'imageIndex': '06',
    'question': "Wolverine's metal claws are made up of: ",
    'options': [
      {'option': 'Uru', 'is_true': false},
      {'option': 'Adamantium', 'is_true': true},
      {'option': 'Vibranium', 'is_true': false},
      {'option': 'Platinum', 'is_true': false}
    ],
  },
  {
    'imageIndex': '07',
    'question': "Who is the king of Wakanda?",
    'options': [
      {'option': 'Iron Fist', 'is_true': false},
      {'option': 'Black Panther', 'is_true': true},
      {'option': 'Iron Man', 'is_true': false},
      {'option': 'Dare Devil', 'is_true': false}
    ],
  },
  {
    'imageIndex': '08',
    'question': "The most powerful Telepath in Marvel Universe is: ",
    'options': [
      {'option': 'Charles Xaviour', 'is_true': true},
      {'option': 'Emma frost', 'is_true': false},
      {'option': 'Mesmero', 'is_true': false},
      {'option': 'Mastermind', 'is_true': false}
    ],
  },
  {
    'imageIndex': '09',
    'question': "Which one of these in Marvel Universe is an immortal?",
    'options': [
      {'option': 'Deadpool', 'is_true': true},
      {'option': 'Wolverine', 'is_true': false},
      {'option': 'Captain America', 'is_true': false},
      {'option': 'The Mandarin', 'is_true': false}
    ],
  },
  {
    'imageIndex': '10',
    'question': "Who is The Spider Man?",
    'options': [
      {'option': 'Peter Parker', 'is_true': true},
      {'option': 'Danny Rand', 'is_true': false},
      {'option': 'Bruce Banner', 'is_true': false},
      {'option': 'Hank MacCoy', 'is_true': false}
    ],
  },
];
