class Status < ActiveHash::Base
  self.data = [
    { id: 1, status: '---'},
    { id: 2, status: '新品・未使用'},
    { id: 3, status: '未使用に近い'},
    { id: 4, status: '目立った傷や汚れなし'},
    { id: 5, status: 'やや傷や汚れあり'},
    { id: 6, status: '傷や汚れあり'},
    { id: 7, status: '全体的に状態が悪い'},
  ]
  include ActiveHash::Associations
  has_many :items
  
end