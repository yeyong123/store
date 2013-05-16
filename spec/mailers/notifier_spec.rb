require "spec_helper"

describe Notifier do
  describe "order_received" do
    let(:mail) { Notifier.order_received }

    it "renders the headers" do
      mail.subject.should eq("Order received")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

  describe "order_shipped" do
    let(:mail) { Notifier.order_shipped }

    it "renders the headers" do
      mail.subject.should eq("Order shipped")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
