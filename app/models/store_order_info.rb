class StoreOrderInfo < ApplicationRecord
  belongs_to :store

  attribute :delivery_reception_time_1_first, :time
  attribute :delivery_reception_time_1_finish, :time
  attribute :delivery_reception_time_2_first, :time
  attribute :delivery_reception_time_2_finish, :time
  attribute :delivery_reception_time_3_first, :time
  attribute :delivery_reception_time_3_finish, :time
  attribute :delivery_reception_time_4_first, :time
  attribute :delivery_reception_time_4_finish, :time
  attribute :delivery_reception_time_5_first, :time
  attribute :delivery_reception_time_5_finish, :time
  attribute :delivery_reception_time_6_first, :time
  attribute :delivery_reception_time_6_finish, :time
  attribute :delivery_reception_time_7_first, :time
  attribute :delivery_reception_time_7_finish, :time

  # 配達受付時間を文字列で整形
  def delivery_reception_conclusion
    self.delivery_reception_time_1 = self.delivery_reception_time_1_first.to_s(:time) + "~" + self.delivery_reception_time_1_finish.to_s(:time)
    self.delivery_reception_time_2 = self.delivery_reception_time_2_first.to_s(:time) + "~" + self.delivery_reception_time_2_finish.to_s(:time)
    self.delivery_reception_time_3 = self.delivery_reception_time_3_first.to_s(:time) + "~" + self.delivery_reception_time_3_finish.to_s(:time)
    self.delivery_reception_time_4 = self.delivery_reception_time_4_first.to_s(:time) + "~" + self.delivery_reception_time_4_finish.to_s(:time)
    self.delivery_reception_time_5 = self.delivery_reception_time_5_first.to_s(:time) + "~" + self.delivery_reception_time_5_finish.to_s(:time)
    self.delivery_reception_time_6 = self.delivery_reception_time_6_first.to_s(:time) + "~" + self.delivery_reception_time_6_finish.to_s(:time)
    self.delivery_reception_time_7 = self.delivery_reception_time_7_first.to_s(:time) + "~" + self.delivery_reception_time_7_finish.to_s(:time)
  end

  # 配達受付時間の編集時に文字列を分解　(仮)
  def delivery_reception_edit
    self.delivery_reception_time_1_first = self.delivery_reception_time_1[/(?<=~)(.*)/]
    self.delivery_reception_time_1_finish = self.delivery_reception_time_1[/(.*)(?=~)/]
  end

end
