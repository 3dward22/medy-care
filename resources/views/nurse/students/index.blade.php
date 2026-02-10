@extends('layouts.app')

@section('content')
<div class="container">
    <h1 class="mb-4">📖 Student Records</h1>
<form method="GET" class="mb-4 flex gap-2">
    <input
        type="text"
        name="q"
        value="{{ request('q') }}"
        placeholder="Search student by name, email, or ID…"
        class="w-full sm:w-1/2 px-4 py-2 border rounded-lg focus:ring focus:ring-teal-200 focus:outline-none"
    >
    <button
        type="submit"
        class="px-4 py-2 bg-teal-600 text-white rounded-lg hover:bg-teal-700"
    >
        Search
    </button>
    @if(request('q'))
        <a
            href="{{ route('nurse.students.index') }}"
            class="px-4 py-2 bg-gray-200 rounded-lg hover:bg-gray-300"
        >
            Clear
        </a>
    @endif
</form>
@if(request('q'))
    <p class="text-sm text-gray-500 mb-2">
        Showing results for: <strong>"{{ request('q') }}"</strong>
    </p>
@endif

    @if($students->count() > 0)
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Registered At</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                @foreach($students as $student)
                <tr>
                    <td>{{ $student->id }}</td>
                    <td>{{ $student->name }}</td>
                    <td>{{ $student->email }}</td>
                    <td>{{ $student->created_at->format('Y-m-d') }}</td>
                    <td>
    <a href="{{ route('nurse.students.records', $student->id) }}"
       class="btn btn-sm btn-primary">
        View Records
    </a>
</td>


                </tr>
                @endforeach
            </tbody>
        </table>
        <div class="mt-4">
    {{ $students->links() }}
</div>

    @else
        <p>No student records found.</p>
    @endif
</div>
@endsection
