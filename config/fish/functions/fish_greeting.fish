function fish_greeting
  set greeting_animals $(random choice "🐬 🦈 🐧 🐠 🪼" "🐡 🐬 🐠 🐙 🐧" "🐳 🐧 🐠 🪼 🦈" "🪼 🐙 🐬 🐡 🐳" "🐧 🐡 🐳 🐬 🐠" "🐙 🪼 🐧 🦈 🐡" "🐬 🐳 🐠 🪼 🐙" "🐡 🐧 🐳 🐬 🦈")
  echo "I'm 🐟 shell, those are my friends $greeting_animals" 
end