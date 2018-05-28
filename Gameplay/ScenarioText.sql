-- Insert SQL Rules Here

-- Add scenario specific entries.
INSERT OR REPLACE INTO LocalizedText (Language, Tag, Gender, Plurality, Text) Select Language, Replace(Tag, 'TXT_KEY_SHOGUN_SCENARIO_', 'TXT_KEY_'), Gender, Plurality, Text from LocalizedText where Tag LIKE 'TXT_KEY_SHOGUN_SCENARIO_%';