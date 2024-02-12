class Talk < ActiveHash::Base
  include ActiveHash::Associations
  belongs_to :deck
  belongs_to :event

  self.data = [
    {
      id: 1,
      deck_id: 2,
      event_id: 1,
      date: '2023-04-24T10:15:00-05:00',
      video_id: nil,
      video_title: nil,
    },
    {
      id: 2,
      deck_id: 4,
      event_id: 2,
      date: '2021-08-11T12:00:00Z',
      video_id: nil,
      video_title: nil,
    },
    {
      id: 3,
      deck_id: 3,
      event_id: 3,
      date: '2021-05-12T12:00:00Z',
      video_id: nil,
      video_title: nil,
    },
    {
      id: 4,
      deck_id: 5,
      event_id: 4,
      date: '2020-01-31T12:00:00Z',
      video_id: 'EypRSLfKvak',
      video_title: 'Birmingham on Rails 2020 - Morning Keynote by Stephan Hagemann',
    },
    {
      id: 5,
      deck_id: 11,
      event_id: 5,
      date: '2017-12-05T12:00:00Z',
      video_id: 'JS1_EHl4FdM',
      video_title: 'Productize Your Services! A Path Towards Effective Microservice Development - Stephan Hagemann',
    },
    {
      id: 6,
      deck_id: 10,
      event_id: 6,
      date: '2016-11-18T12:00:00Z',
      video_id: nil,
      video_title: nil,
    },
    {
      id: 7,
      deck_id: 8,
      event_id: 7,
      date: '2015-05-02T12:00:00Z',
      video_id: 'MsRPxS7Cu_Q',
      video_title: 'RailsConf 2015 - Get started with Component-based Rails applications!',
    },
    {
      id: 8,
      deck_id: 9,
      event_id: 8,
      date: '2014-04-23T12:00:00Z',
      video_id: 'MIhlAiMc7tU',
      video_title: 'RailsConf 2014 - Refactoring Towards Component-based Rails Architectures',
    },
    {
      id: 9,
      deck_id: 6,
      event_id: 9,
      date: '2013-04-03T12:00:00Z',
      video_id: '-54SDanDC00',
      video_title: 'MountainWest RubyConf 2013 Component-based Architectures in Ruby and Rails by Stephan Hagemann',
    },
    {
      id: 10,
      deck_id: 3,
      event_id: 10,
      date: '2012-09-21T12:00:00Z',
      video_id: 'FElnETSIMuo',
      video_title: 'Rocky Mountain Ruby 2012 - Wrangling Large Rails Codebases by Stephan Hagemann',
    },
  ]
end