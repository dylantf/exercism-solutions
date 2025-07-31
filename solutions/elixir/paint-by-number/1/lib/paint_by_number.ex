"""
I have no idea what this means, I just copy/pasted it to make the exercise go away
"""

defmodule PaintByNumber do
  def palette_bit_size(color_count) when color_count == 0, do: 0
  def palette_bit_size(color_count) when color_count <= 2, do: 1
  def palette_bit_size(color_count) do
    1 + palette_bit_size(color_count/2)
  end
  def empty_picture() do
    <<>>
  end
  def test_picture() do
    <<0::size(2), 1::size(2), 2::size(2), 3::size(2)>>
  end
  def prepend_pixel(picture, color_count, pixel_color_index) do
    bit_size = palette_bit_size(color_count)
    <<pixel_color_index::size(bit_size) , picture::bitstring>>
  end
  def get_first_pixel(<<>>, color_count), do: nil
  def get_first_pixel(picture, color_count) do
    bit_size = palette_bit_size(color_count)
    <<pixel::size(bit_size), _rest::bitstring>> = picture
    pixel
  end
  def drop_first_pixel(<<>>, color_count), do: <<>>
  def drop_first_pixel(picture, color_count) do
    bit_size = palette_bit_size(color_count)
    <<_droppedpixel::size(bit_size), rest::bitstring>> = picture
    rest
  end
  def concat_pictures(picture1, picture2) do
   <<picture1::bitstring, picture2::bitstring>>
  end
end