/// 1.Creating and Using Cubit
/// Learn how to create a Cubit class, extend Cubit<State>, and use the emit() method to output new states.
/// Understand how to create state classes that are either single classes or part of a class hierarchy.

/// 2. Cubit and Flutter Integration
/// Use BlocProvider to provide a Cubit to a widget tree.
/// Use BlocBuilder to listen for state changes and rebuild UI accordingly.
/// Understand how BlocListener can be used for side effects without rebuilding the UI.

// 3. Advanced Topics
// Learn about the HydratedCubit for state persistence across app restarts.
// Understand how to handle complex state management with multiple Cubits working together or
// alongside other state management solutions.

// 4. Performance Considerations
// Optimize performance by ensuring Cubits do not rebuild unnecessary parts of the widget tree.
// Familiarize yourself with tools like flutter_bloc's BlocSelector for more selective state listening.

///WHY USE HIERARCHY ?
///Flexibility: You can now handle different states (e.g., loading, success, error) with separate state classes.
///Scalability: As your app grows, you can easily add more specific states (e.g., CounterLoading, CounterSuccess, CounterError).
///Better State Management: It's easier to manage multiple states, such as when a state transitions from loading to loaded or when an error happens.
///_____________________________________________________________________
/// Base class for Counter state
/// The abstract base class represents the general idea of a state.
/// All states will inherit from this class.