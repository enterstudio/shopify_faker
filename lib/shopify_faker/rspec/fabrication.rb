module ShopifyFaker
  module RSpec
    module Fabrication
      extend ActiveSupport::Concern

      included do
        let(:shopify_product)   { attributes_for(:shopify_product, variants: shopify_variants, images: shopify_images) }
        let(:shopify_order)     { attributes_for(:shopify_order, fulfillments: shopify_fulfillments) }

        let(:shopify_variants)     { [shopify_variant] }
        let(:shopify_images)       { [shopify_image] }
        let(:shopify_fulfillments) { [shopify_fulfillment] }

        let(:shopify_variant)      { attributes_for(:shopify_variant, id: variant_id, title: variant_title, image_id: image_id) }
        let(:shopify_image)        { attributes_for(:shopify_image, id: image_id, position: position, variant_ids: variant_ids) }
        let(:shopify_fulfillment)  { attributes_for(:shopify_fulfillment, status: fulfillment_status, created_at: fulfillment_created_at, updated_at: fulfillment_updated_at) }
        let(:variant_ids)          { [variant_id] }
        let(:variant_id)           { rand_shopify_id.() }
        let(:product_id)           { rand_shopify_id.() }
        let(:image_id)             { rand_shopify_id.() }

        let(:product_title)   { Faker::Commerce.product_name }
        let(:product_type)    { Faker::Lorem.word }
        let(:variant_title)   { Faker::Commerce.product_name }
        let(:position)        { rand(10) }
        let(:vendor)          { Faker::Company.name }
        let(:handle)          { Faker::Internet.slug(Faker::Company.bs) }

        let(:fulfillment_status)     { 'success' }
        let(:fulfillment_created_at) { (rand(10) + 5).days.ago.iso8601 }
        let(:fulfillment_updated_at) { (DateTime.parse(fulfillment_created_at) + rand(3).days).iso8601 }

        let(:rand_shopify_id) { ->(_ = nil) { Faker::Number.number(12).to_i } }
      end

      def attributes_for(*args)
        Fabricate.attributes_for(*args)
      end
    end
  end
end
