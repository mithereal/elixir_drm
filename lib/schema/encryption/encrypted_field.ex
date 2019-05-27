## lifted from https://github.com/dwyl/phoenix-ecto-encryption-example
defmodule Encryption.EncryptedField do

   @moduledoc false
   
    # alias our AES encrypt & decrypt functions (3.1 & 3.2)
    alias Encryption.AES

  @behaviour Ecto.Type  # Check this module conforms to Ecto.type behavior.
  def type, do: :binary # :binary is the data type ecto uses internally

  # cast/1 simply calls to_string on the value and returns a "success" tuple
  def cast(value) do
    {:ok, to_string(value)}
  end

  # dump/1 is called when the field value is about to be written to the database
  def dump(value) do
    ciphertext = value |> to_string |> AES.encrypt
    {:ok, ciphertext} # ciphertext is :binary type (no conversion required)
  end

  # load/1 is called when the field is loaded from the database
  def load(value) do
    {:ok, AES.decrypt(value)}
  end

  # load/2 is called with a specific key_id when the field is loaded from DB
  def load(value, key_id) do
    {:ok, AES.decrypt(value, key_id)}
  end
end
