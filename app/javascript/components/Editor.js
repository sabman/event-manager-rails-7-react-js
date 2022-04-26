import React, { useState, useEffect } from "react";
import Header from "./Header";
import EventList from "./EventList";

const Editor = () => {
  const [events, setEvents] = useState([]);
  const [isLoading, setIsLoading] = useState(true);
  const [isError, setIsError] = useState(false);

  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await fetch("/api/events");
        if (!response.ok) throw new Error(response.statusText);
        const events = await response.json();
        setEvents(events);
      } catch (error) {
        setIsError(true);
        console.log(error);
      }

      setIsLoading(false);
    };

    fetchData();
  }, []);

  return (
    <>
      <Header />
      {isError && <div>Something went wrong ...</div>}
      {isLoading ? <p>Loading ...</p> : <EventList events={events} />}
    </>
  );
};

export default Editor;
