# frozen_string_literal: true

module Quickdraw::Matchers::ToHaveAttributes
	def to_have_attributes(**attributes)
		attributes.each do |k, v|
			assert v === value.__send__(k) do
				"expected `#{value.inspect}` to have the attribute `#{k.inspect}` equal to `#{v.inspect}`"
			end
		end
	rescue NoMethodError => e
		failure! { "expected `#{value.inspect}` to respond to `#{e.name}`" }
	end
end
