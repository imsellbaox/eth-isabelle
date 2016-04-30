theory YellowPaper

imports Main "~~/src/HOL/Word/Word"

begin

type_synonym uint256 = "256 word"
type_synonym word32 = "32 word"

text "2. The Blockchain Paradigm"

text "The equations (1) until (4) are rather abstract."
text "Skipping them for now, hoping we can revisit them."

text "2.1. Value."

definition "Wei :: uint256 == 10 ^ 0"
definition "Szabo :: uint256 == 10 ^ 12"
definition "Finney :: uint256 == 10 ^ 15"
definition "Ether :: uint256 == 10 ^ 18"

text "Thanks to uint256, these values can be computed quickly."
value "Wei"
value "Szabo"
value "Finney"
value "Ether"

text "2.2. Which History?"
text "This aspect is not modelled."
text "I aim at modelling a linear history first."

text "3. Conventions"

text "Greek letters"
value "\<Upsilon>"
value "\<iota>"

text "Can I use bold characters as symbols?"

text "How to access slices of arrays?"
text "I think I will implement a notation like \<mu>[0..31]"

text "equation (5)"

definition "l == last"

text "4. Blocks, State and the Transactions"

text "4.1. World State"

text "State is a mapping from addresses to account states."

text "Now I have to choose if I model the account state
      as a byte sequence or a struct.  This is essentially
      about allowing invalid RLP or not.  I choose not."

type_synonym "address" = "160 word"

text "Shall I model the nonce as a natural number?"
text "Well, I'll just use uint256. -> (11) and (12) support this."

text "Shall I model the storage just as a hash or not."
text "Mathematically, there are many states that maps to"
text "a single hash, though it's hard to find more than one."
text "So I need to embed the whole storage here."
text "For the same reason, I record code not just the code hash."

type_synonym byte = "8 word"
type_synonym storage = "uint256 \<Rightarrow> uint256"

record "account_state" =
  Nonce :: "uint256"
  Balance :: "uint256"
  Storage :: "storage"
  CodeHash :: "byte list"

type_synonym "state" = "address \<Rightarrow> account_state"

text "TODO"
text "I will need to compute a codeHash from the code."

text "TODO"
text "Also I will need to compute a storageRoot from the"
text "storage."
text "Equation (6) is convenient for this."

text "Question about text:"
text "not a 'physical' member of the account"

text "TODO"
text "Model the world-state collapse function L_S"

text "(11) will be encoded in the types"
text "when the hash functions will be defined."

text "4.2. Transaction."
text "I think I will delay the implementation of this part,"
text "until the hash functions are implemented."
text "The transaction part has already been modelled in"
text "the Coq formalization more or less."
text "Currently I'm interested if the hash function"
text "defined here would be nicely executable."

end
